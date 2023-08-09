%include "../include/io.mac"

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

section .text
    global sort_procs

sort_procs:
    ;; DO NOT MODIFY
    enter 0,0
    pusha

    mov edx, [ebp + 8]      ; processes
    mov eax, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ;; Your code starts here
	
	
	;; ecx este contor pentru primul for
	xor ecx, ecx
	dec eax
	
primul_for:
	cmp ecx, eax
	jge terminare
	inc ecx
	
	;; edi este contor pentru al doilea for
	xor edi, edi
	
al_doilea_for:
	xor ebx, ebx
	xor esi, esi
	
	mov esi, edi
	imul esi, 5
	
	;; se retine valoarea curenta pentru comparare
	mov bl, byte [edx + esi + 2]
	
	;; se compara cu valoarea urmatoare
	cmp bl, byte [edx + esi + 7]
	jg interschimbare
	je ordonare_crt_2
	
continuare_dupa_interschimbare:
	inc edi
	
	;; se verifica in ce for trebuie sa se duca
	cmp edi, eax
	jl al_doilea_for

	jmp primul_for
	
	
	;; se interschimba valorile
interschimbare:
	push eax
	xor eax, eax
	xor ebx, ebx
	
	;; se interschimba pid - ul
	mov bx, word [edx + esi]
	mov ax, word [edx + esi + 5]
	mov word [edx + esi], ax
	mov word [edx + esi + 5], bx
	
	xor ebx, ebx
	xor eax, eax
	
	;; se interschimba "prio"
	mov bl, [edx + esi + 2]
	mov al, [edx + esi + 7]
	mov byte [edx + esi + 2], al
	mov byte [edx + esi + 7], bl
	
	xor ebx, ebx
	xor eax, eax
	
	;; se interschimba "time"
	mov bx, [edx + esi + 3]
	mov ax, word [edx + esi + 8]
	mov word [edx + esi + 3], ax
	mov word [edx + esi + 8], bx
	
	xor eax, eax
	pop eax
	
	jmp continuare_dupa_interschimbare
	
	
	;; criteriul al doilea de comparare
ordonare_crt_2:
	xor ebx, ebx
	
	;; se retine valoare pentru al doilea criteriu de comparare
	mov bx, [edx + esi + 3]
	
	;; se decide ce trebuie sa faca
	cmp bx, [edx + esi + 8]
	jg interschimbare
	je ordonare_crt_3
	
	jmp continuare_dupa_interschimbare
	
	
	;; al treilea criteriu de comparare
ordonare_crt_3:
	xor ebx, ebx
	
	;; se retine valoare pentru al treilea criteriu de comparare
	mov bx, [edx + esi]
	
	cmp bx, [edx + esi + 5]
	jg interschimbare
	jmp continuare_dupa_interschimbare
	
	
terminare:
	
	;; Your code ends here
	
	;; DO NOT MODIFY
	popa
	leave
	ret
	;; DO NOT MODIFY
