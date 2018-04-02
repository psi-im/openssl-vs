# start it like powershell  -executionpolicy bypass -nologo -File genasm.ps1
function Gen-Asm ($fpath, $destPath) {
   If (($fpath -match "86" -or $fpath -match "avx" -or $fpath -match "mmx") -And (($fpath -match "asm" -And (-not ($fpath -match "perlasm"))) -or ($fpath -match "cpuid"))) {
     if ((-Not (Test-Path -Path $destPath)) -Or ((Get-ChildItem $destPath).ModificationTime -lt (Get-ChildItem $fpath).ModificationTime)) {
	   $nasmCmd = "nasm"
	   if ($fpath -match "586" -or $fpath -match "x86-" -or $fpath -match "x86\." -or $fpath -match "mmx" -or $fpath -match "x86cpu") { $nasmCmd="win32n" }
       $unixpath = $fpath -replace "\\", "/";
	   Write-Output "Try to generate $destPath by $fpath";
	   ./perl.cmd "$unixpath" "$nasmCmd" $destPath;
	 } else {
	   Write-Output "Skip $destPath as already updated";
	 }
   }
}

Get-ChildItem -Path openssl/crypto -Filter "*.pl" -Recurse -ErrorAction SilentlyContinue -Force  |
ForEach-Object {
   $fpath = %{$_.FullName}
   $noext=[io.path]::GetFileNameWithoutExtension($_);
   $destPath = "crypto/$noext.asm";
   Gen-Asm $fpath $destPath
}

Gen-Asm "openssl\crypto\sha\asm\sha512-x86_64.pl" ".\crypto\sha256-x86_64.asm"

# bash
# ensure "/c/Program Files (x86)/Microsoft Visual Studio 14.0/VC" or whatever where yasm is installed is in PATH.
# find openssl/crypto/ -name '*.pl' | grep -E 'asm|cpuid' | while read -r f; do echo "$f"; perl "$f" nasm crypto/$(basename "$f" .pl).asm; done