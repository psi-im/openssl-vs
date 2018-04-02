%ifidn __OUTPUT_FORMAT__,obj
section	code	use32 class=code align=64
%elifidn __OUTPUT_FORMAT__,win32
$@feat.00 equ 1
section	.text	code align=64
%else
section	.text	code
%endif
global	_RC5_32_encrypt
align	16
_RC5_32_encrypt:
L$_RC5_32_encrypt_begin:
	; 
	push	ebp
	push	esi
	push	edi
	mov	edx,DWORD [16+esp]
	mov	ebp,DWORD [20+esp]
	; Load the 2 words
	mov	edi,DWORD [edx]
	mov	esi,DWORD [4+edx]
	push	ebx
	mov	ebx,DWORD [ebp]
	add	edi,DWORD [4+ebp]
	add	esi,DWORD [8+ebp]
	xor	edi,esi
	mov	eax,DWORD [12+ebp]
	mov	ecx,esi
	rol	edi,cl
	add	edi,eax
	xor	esi,edi
	mov	eax,DWORD [16+ebp]
	mov	ecx,edi
	rol	esi,cl
	add	esi,eax
	xor	edi,esi
	mov	eax,DWORD [20+ebp]
	mov	ecx,esi
	rol	edi,cl
	add	edi,eax
	xor	esi,edi
	mov	eax,DWORD [24+ebp]
	mov	ecx,edi
	rol	esi,cl
	add	esi,eax
	xor	edi,esi
	mov	eax,DWORD [28+ebp]
	mov	ecx,esi
	rol	edi,cl
	add	edi,eax
	xor	esi,edi
	mov	eax,DWORD [32+ebp]
	mov	ecx,edi
	rol	esi,cl
	add	esi,eax
	xor	edi,esi
	mov	eax,DWORD [36+ebp]
	mov	ecx,esi
	rol	edi,cl
	add	edi,eax
	xor	esi,edi
	mov	eax,DWORD [40+ebp]
	mov	ecx,edi
	rol	esi,cl
	add	esi,eax
	xor	edi,esi
	mov	eax,DWORD [44+ebp]
	mov	ecx,esi
	rol	edi,cl
	add	edi,eax
	xor	esi,edi
	mov	eax,DWORD [48+ebp]
	mov	ecx,edi
	rol	esi,cl
	add	esi,eax
	xor	edi,esi
	mov	eax,DWORD [52+ebp]
	mov	ecx,esi
	rol	edi,cl
	add	edi,eax
	xor	esi,edi
	mov	eax,DWORD [56+ebp]
	mov	ecx,edi
	rol	esi,cl
	add	esi,eax
	xor	edi,esi
	mov	eax,DWORD [60+ebp]
	mov	ecx,esi
	rol	edi,cl
	add	edi,eax
	xor	esi,edi
	mov	eax,DWORD [64+ebp]
	mov	ecx,edi
	rol	esi,cl
	add	esi,eax
	xor	edi,esi
	mov	eax,DWORD [68+ebp]
	mov	ecx,esi
	rol	edi,cl
	add	edi,eax
	xor	esi,edi
	mov	eax,DWORD [72+ebp]
	mov	ecx,edi
	rol	esi,cl
	add	esi,eax
	cmp	ebx,8
	je	NEAR L$000rc5_exit
	xor	edi,esi
	mov	eax,DWORD [76+ebp]
	mov	ecx,esi
	rol	edi,cl
	add	edi,eax
	xor	esi,edi
	mov	eax,DWORD [80+ebp]
	mov	ecx,edi
	rol	esi,cl
	add	esi,eax
	xor	edi,esi
	mov	eax,DWORD [84+ebp]
	mov	ecx,esi
	rol	edi,cl
	add	edi,eax
	xor	esi,edi
	mov	eax,DWORD [88+ebp]
	mov	ecx,edi
	rol	esi,cl
	add	esi,eax
	xor	edi,esi
	mov	eax,DWORD [92+ebp]
	mov	ecx,esi
	rol	edi,cl
	add	edi,eax
	xor	esi,edi
	mov	eax,DWORD [96+ebp]
	mov	ecx,edi
	rol	esi,cl
	add	esi,eax
	xor	edi,esi
	mov	eax,DWORD [100+ebp]
	mov	ecx,esi
	rol	edi,cl
	add	edi,eax
	xor	esi,edi
	mov	eax,DWORD [104+ebp]
	mov	ecx,edi
	rol	esi,cl
	add	esi,eax
	cmp	ebx,12
	je	NEAR L$000rc5_exit
	xor	edi,esi
	mov	eax,DWORD [108+ebp]
	mov	ecx,esi
	rol	edi,cl
	add	edi,eax
	xor	esi,edi
	mov	eax,DWORD [112+ebp]
	mov	ecx,edi
	rol	esi,cl
	add	esi,eax
	xor	edi,esi
	mov	eax,DWORD [116+ebp]
	mov	ecx,esi
	rol	edi,cl
	add	edi,eax
	xor	esi,edi
	mov	eax,DWORD [120+ebp]
	mov	ecx,edi
	rol	esi,cl
	add	esi,eax
	xor	edi,esi
	mov	eax,DWORD [124+ebp]
	mov	ecx,esi
	rol	edi,cl
	add	edi,eax
	xor	esi,edi
	mov	eax,DWORD [128+ebp]
	mov	ecx,edi
	rol	esi,cl
	add	esi,eax
	xor	edi,esi
	mov	eax,DWORD [132+ebp]
	mov	ecx,esi
	rol	edi,cl
	add	edi,eax
	xor	esi,edi
	mov	eax,DWORD [136+ebp]
	mov	ecx,edi
	rol	esi,cl
	add	esi,eax
L$000rc5_exit:
	mov	DWORD [edx],edi
	mov	DWORD [4+edx],esi
	pop	ebx
	pop	edi
	pop	esi
	pop	ebp
	ret
global	_RC5_32_decrypt
align	16
_RC5_32_decrypt:
L$_RC5_32_decrypt_begin:
	; 
	push	ebp
	push	esi
	push	edi
	mov	edx,DWORD [16+esp]
	mov	ebp,DWORD [20+esp]
	; Load the 2 words
	mov	edi,DWORD [edx]
	mov	esi,DWORD [4+edx]
	push	ebx
	mov	ebx,DWORD [ebp]
	cmp	ebx,12
	je	NEAR L$001rc5_dec_12
	cmp	ebx,8
	je	NEAR L$002rc5_dec_8
	mov	eax,DWORD [136+ebp]
	sub	esi,eax
	mov	ecx,edi
	ror	esi,cl
	xor	esi,edi
	mov	eax,DWORD [132+ebp]
	sub	edi,eax
	mov	ecx,esi
	ror	edi,cl
	xor	edi,esi
	mov	eax,DWORD [128+ebp]
	sub	esi,eax
	mov	ecx,edi
	ror	esi,cl
	xor	esi,edi
	mov	eax,DWORD [124+ebp]
	sub	edi,eax
	mov	ecx,esi
	ror	edi,cl
	xor	edi,esi
	mov	eax,DWORD [120+ebp]
	sub	esi,eax
	mov	ecx,edi
	ror	esi,cl
	xor	esi,edi
	mov	eax,DWORD [116+ebp]
	sub	edi,eax
	mov	ecx,esi
	ror	edi,cl
	xor	edi,esi
	mov	eax,DWORD [112+ebp]
	sub	esi,eax
	mov	ecx,edi
	ror	esi,cl
	xor	esi,edi
	mov	eax,DWORD [108+ebp]
	sub	edi,eax
	mov	ecx,esi
	ror	edi,cl
	xor	edi,esi
L$001rc5_dec_12:
	mov	eax,DWORD [104+ebp]
	sub	esi,eax
	mov	ecx,edi
	ror	esi,cl
	xor	esi,edi
	mov	eax,DWORD [100+ebp]
	sub	edi,eax
	mov	ecx,esi
	ror	edi,cl
	xor	edi,esi
	mov	eax,DWORD [96+ebp]
	sub	esi,eax
	mov	ecx,edi
	ror	esi,cl
	xor	esi,edi
	mov	eax,DWORD [92+ebp]
	sub	edi,eax
	mov	ecx,esi
	ror	edi,cl
	xor	edi,esi
	mov	eax,DWORD [88+ebp]
	sub	esi,eax
	mov	ecx,edi
	ror	esi,cl
	xor	esi,edi
	mov	eax,DWORD [84+ebp]
	sub	edi,eax
	mov	ecx,esi
	ror	edi,cl
	xor	edi,esi
	mov	eax,DWORD [80+ebp]
	sub	esi,eax
	mov	ecx,edi
	ror	esi,cl
	xor	esi,edi
	mov	eax,DWORD [76+ebp]
	sub	edi,eax
	mov	ecx,esi
	ror	edi,cl
	xor	edi,esi
L$002rc5_dec_8:
	mov	eax,DWORD [72+ebp]
	sub	esi,eax
	mov	ecx,edi
	ror	esi,cl
	xor	esi,edi
	mov	eax,DWORD [68+ebp]
	sub	edi,eax
	mov	ecx,esi
	ror	edi,cl
	xor	edi,esi
	mov	eax,DWORD [64+ebp]
	sub	esi,eax
	mov	ecx,edi
	ror	esi,cl
	xor	esi,edi
	mov	eax,DWORD [60+ebp]
	sub	edi,eax
	mov	ecx,esi
	ror	edi,cl
	xor	edi,esi
	mov	eax,DWORD [56+ebp]
	sub	esi,eax
	mov	ecx,edi
	ror	esi,cl
	xor	esi,edi
	mov	eax,DWORD [52+ebp]
	sub	edi,eax
	mov	ecx,esi
	ror	edi,cl
	xor	edi,esi
	mov	eax,DWORD [48+ebp]
	sub	esi,eax
	mov	ecx,edi
	ror	esi,cl
	xor	esi,edi
	mov	eax,DWORD [44+ebp]
	sub	edi,eax
	mov	ecx,esi
	ror	edi,cl
	xor	edi,esi
	mov	eax,DWORD [40+ebp]
	sub	esi,eax
	mov	ecx,edi
	ror	esi,cl
	xor	esi,edi
	mov	eax,DWORD [36+ebp]
	sub	edi,eax
	mov	ecx,esi
	ror	edi,cl
	xor	edi,esi
	mov	eax,DWORD [32+ebp]
	sub	esi,eax
	mov	ecx,edi
	ror	esi,cl
	xor	esi,edi
	mov	eax,DWORD [28+ebp]
	sub	edi,eax
	mov	ecx,esi
	ror	edi,cl
	xor	edi,esi
	mov	eax,DWORD [24+ebp]
	sub	esi,eax
	mov	ecx,edi
	ror	esi,cl
	xor	esi,edi
	mov	eax,DWORD [20+ebp]
	sub	edi,eax
	mov	ecx,esi
	ror	edi,cl
	xor	edi,esi
	mov	eax,DWORD [16+ebp]
	sub	esi,eax
	mov	ecx,edi
	ror	esi,cl
	xor	esi,edi
	mov	eax,DWORD [12+ebp]
	sub	edi,eax
	mov	ecx,esi
	ror	edi,cl
	xor	edi,esi
	sub	esi,DWORD [8+ebp]
	sub	edi,DWORD [4+ebp]
L$003rc5_exit:
	mov	DWORD [edx],edi
	mov	DWORD [4+edx],esi
	pop	ebx
	pop	edi
	pop	esi
	pop	ebp
	ret
global	_RC5_32_cbc_encrypt
align	16
_RC5_32_cbc_encrypt:
L$_RC5_32_cbc_encrypt_begin:
	; 
	push	ebp
	push	ebx
	push	esi
	push	edi
	mov	ebp,DWORD [28+esp]
	; getting iv ptr from parameter 4
	mov	ebx,DWORD [36+esp]
	mov	esi,DWORD [ebx]
	mov	edi,DWORD [4+ebx]
	push	edi
	push	esi
	push	edi
	push	esi
	mov	ebx,esp
	mov	esi,DWORD [36+esp]
	mov	edi,DWORD [40+esp]
	; getting encrypt flag from parameter 5
	mov	ecx,DWORD [56+esp]
	; get and push parameter 3
	mov	eax,DWORD [48+esp]
	push	eax
	push	ebx
	cmp	ecx,0
	jz	NEAR L$004decrypt
	and	ebp,4294967288
	mov	eax,DWORD [8+esp]
	mov	ebx,DWORD [12+esp]
	jz	NEAR L$005encrypt_finish
L$006encrypt_loop:
	mov	ecx,DWORD [esi]
	mov	edx,DWORD [4+esi]
	xor	eax,ecx
	xor	ebx,edx
	mov	DWORD [8+esp],eax
	mov	DWORD [12+esp],ebx
	call	L$_RC5_32_encrypt_begin
	mov	eax,DWORD [8+esp]
	mov	ebx,DWORD [12+esp]
	mov	DWORD [edi],eax
	mov	DWORD [4+edi],ebx
	add	esi,8
	add	edi,8
	sub	ebp,8
	jnz	NEAR L$006encrypt_loop
L$005encrypt_finish:
	mov	ebp,DWORD [52+esp]
	and	ebp,7
	jz	NEAR L$007finish
	call	L$008PIC_point
L$008PIC_point:
	pop	edx
	lea	ecx,[(L$009cbc_enc_jmp_table-L$008PIC_point)+edx]
	mov	ebp,DWORD [ebp*4+ecx]
	add	ebp,edx
	xor	ecx,ecx
	xor	edx,edx
	jmp	ebp
L$010ej7:
	mov	dh,BYTE [6+esi]
	shl	edx,8
L$011ej6:
	mov	dh,BYTE [5+esi]
L$012ej5:
	mov	dl,BYTE [4+esi]
L$013ej4:
	mov	ecx,DWORD [esi]
	jmp	NEAR L$014ejend
L$015ej3:
	mov	ch,BYTE [2+esi]
	shl	ecx,8
L$016ej2:
	mov	ch,BYTE [1+esi]
L$017ej1:
	mov	cl,BYTE [esi]
L$014ejend:
	xor	eax,ecx
	xor	ebx,edx
	mov	DWORD [8+esp],eax
	mov	DWORD [12+esp],ebx
	call	L$_RC5_32_encrypt_begin
	mov	eax,DWORD [8+esp]
	mov	ebx,DWORD [12+esp]
	mov	DWORD [edi],eax
	mov	DWORD [4+edi],ebx
	jmp	NEAR L$007finish
L$004decrypt:
	and	ebp,4294967288
	mov	eax,DWORD [16+esp]
	mov	ebx,DWORD [20+esp]
	jz	NEAR L$018decrypt_finish
L$019decrypt_loop:
	mov	eax,DWORD [esi]
	mov	ebx,DWORD [4+esi]
	mov	DWORD [8+esp],eax
	mov	DWORD [12+esp],ebx
	call	L$_RC5_32_decrypt_begin
	mov	eax,DWORD [8+esp]
	mov	ebx,DWORD [12+esp]
	mov	ecx,DWORD [16+esp]
	mov	edx,DWORD [20+esp]
	xor	ecx,eax
	xor	edx,ebx
	mov	eax,DWORD [esi]
	mov	ebx,DWORD [4+esi]
	mov	DWORD [edi],ecx
	mov	DWORD [4+edi],edx
	mov	DWORD [16+esp],eax
	mov	DWORD [20+esp],ebx
	add	esi,8
	add	edi,8
	sub	ebp,8
	jnz	NEAR L$019decrypt_loop
L$018decrypt_finish:
	mov	ebp,DWORD [52+esp]
	and	ebp,7
	jz	NEAR L$007finish
	mov	eax,DWORD [esi]
	mov	ebx,DWORD [4+esi]
	mov	DWORD [8+esp],eax
	mov	DWORD [12+esp],ebx
	call	L$_RC5_32_decrypt_begin
	mov	eax,DWORD [8+esp]
	mov	ebx,DWORD [12+esp]
	mov	ecx,DWORD [16+esp]
	mov	edx,DWORD [20+esp]
	xor	ecx,eax
	xor	edx,ebx
	mov	eax,DWORD [esi]
	mov	ebx,DWORD [4+esi]
L$020dj7:
	ror	edx,16
	mov	BYTE [6+edi],dl
	shr	edx,16
L$021dj6:
	mov	BYTE [5+edi],dh
L$022dj5:
	mov	BYTE [4+edi],dl
L$023dj4:
	mov	DWORD [edi],ecx
	jmp	NEAR L$024djend
L$025dj3:
	ror	ecx,16
	mov	BYTE [2+edi],cl
	shl	ecx,16
L$026dj2:
	mov	BYTE [1+esi],ch
L$027dj1:
	mov	BYTE [esi],cl
L$024djend:
	jmp	NEAR L$007finish
L$007finish:
	mov	ecx,DWORD [60+esp]
	add	esp,24
	mov	DWORD [ecx],eax
	mov	DWORD [4+ecx],ebx
	pop	edi
	pop	esi
	pop	ebx
	pop	ebp
	ret
align	64
L$009cbc_enc_jmp_table:
dd	0
dd	L$017ej1-L$008PIC_point
dd	L$016ej2-L$008PIC_point
dd	L$015ej3-L$008PIC_point
dd	L$013ej4-L$008PIC_point
dd	L$012ej5-L$008PIC_point
dd	L$011ej6-L$008PIC_point
dd	L$010ej7-L$008PIC_point
align	64
