# start it like powershell  -executionpolicy bypass -nologo -File genasm.ps1
function Gen-Asm ($fpath, $destPath) {
   If (($fpath -match "86" -or $fpath -match "avx" -or $fpath -match "mmx") -And (($fpath -match "asm" -And (-not ($fpath -match "perlasm"))) -or ($fpath -match "cpuid"))) {
     if ((-Not (Test-Path -Path $destPath)) -Or ((Get-ChildItem $destPath).ModificationTime -lt (Get-ChildItem $fpath).ModificationTime)) {
	   Write-Output "Try to generate $destPath by $fpath";
	   $unixpath = $fpath -replace "\\", "/";
	   $env:FLAGC = ""
	   if ($fpath -match "586" -or $fpath -match "x86-" -or $fpath -match "x86\." -or $fpath -match "mmx" -or $fpath -match "x86cpu") {
		 ./perl.cmd "$unixpath" win32n -DDSO_WIN32 -DNDEBUG -DOPENSSL_THREADS -DOPENSSL_NO_STATIC_ENGINE -DOPENSSL_PIC -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DRMD160_ASM -DAES_ASM -DVPAES_ASM -DWHIRLPOOL_ASM -DGHASH_ASM -DECP_NISTZ256_ASM -DPOLY1305_ASM -DOPENSSL_SYS_WIN32 -DWIN32_LEAN_AND_MEAN -DL_ENDIAN -D_CRT_SECURE_NO_DEPRECATE -DOPENSSL_BN_ASM_PART_WORDS >$destPath;
	   } else {
	     ./perl.cmd "$unixpath" nasm $destPath;
	   }
	 } else {
	   Write-Output "Skip $destPath as already updated";
	 }
   }
}

Get-ChildItem -Path openssl/crypto -Filter "*.pl" -Recurse -ErrorAction SilentlyContinue -Force  |
ForEach-Object {
   $fpath = %{$_.FullName}
   $noext=[io.path]::GetFileNameWithoutExtension($_);
   if (-not (($noext -match "^x86$") -or ($noext -match "^bf-686$"))) { # ignore some scripts early
     $destPath = "crypto/$noext.asm";
     Gen-Asm $fpath $destPath
   }
}

Gen-Asm "openssl\crypto\sha\asm\sha512-x86_64.pl" ".\crypto\sha256-x86_64.asm"

# bash
# ensure "/c/Program Files (x86)/Microsoft Visual Studio 14.0/VC" or whatever where yasm is installed is in PATH.
# find openssl/crypto/ -name '*.pl' | grep -E 'asm|cpuid' | while read -r f; do echo "$f"; perl "$f" nasm crypto/$(basename "$f" .pl).asm; done