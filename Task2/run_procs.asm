%include "../include/io.mac"

    ;;
    ;;   TODO: Declare 'avg' struct to match its C counterpart
    ;;

struc avg
    .quo: resw 1
    .remain: resw 1
endstruc

struc proc
    .pid: resw 1
    .prio: resb 1
    .time: resw 1
endstruc

    ;; Hint: you can use these global arrays
section .data
    prio_result dd 0, 0, 0, 0, 0
    time_result dd 0, 0, 0, 0, 0

section .text
    global run_procs

run_procs:
    ;; DO NOT MODIFY

    push ebp
    mov ebp, esp
    pusha

    xor ecx, ecx

clean_results:
    mov dword [time_result + 4 * ecx], dword 0
    mov dword [prio_result + 4 * ecx],  0

    inc ecx
    cmp ecx, 5
    jne clean_results

    mov ecx, [ebp + 8]      ; processes
    mov ebx, [ebp + 12]     ; length
    mov eax, [ebp + 16]     ; proc_avg
    ;; DO NOT MODIFY
   
    ;; Your code starts here
	
	
	;; esi este contor pentru a parcurge structura proc
	xor esi, esi
	
	;; se parcurge structura proc
parcurgere_structura:
	cmp esi, ebx
	jge initializare
	
	xor edi, edi
	mov edi, esi
	imul edi, 5
	xor edx, edx
	
	;; dl retine ce prioritate e
	mov dl, byte [ecx + edi + 2]
	
	;; se adauga valoarea in vectorul prio_result
	add dword [prio_result + edx * 4 - 4], 1
	
	push eax
	xor eax, eax
	mov ax, word [ecx + edi + 3]
	
	;; se adauga valoarea in vectorul time_result
	add [time_result + edx * 4 - 4], eax
	
	inc esi
	pop eax
	jmp parcurgere_structura
	
	
initializare:
	;; esi este contor cu care parcurg cei doi vectori
	xor esi, esi
	
	;; se parcurg vectorii si se initilizeaza structura avg
punere_valori:
	cmp esi, 5
	jge terminare
	
	push eax
	
	xor eax, eax
	xor edx, edx
	xor edi, edi
	
	;; se retine timpul unei proritati
	mov eax, [time_result + esi * 4]
	
	;; se retine numarul de prioritati cu aceeasi valoare
	mov edi, [prio_result + esi * 4]
	
	;; se verifica sa nu se imparta la 0
	cmp edi, 0
	je verificare_dif_0
	
	;; se realizeaza impartirea
	idiv edi
	xor edi, edi
	pop edi
	
	;; se retin valorile rezultate in structura
	mov [edi + esi * 4], ax
	mov [edi + esi * 4 + 2], dx
	
	inc esi
	xor eax, eax
	mov eax, edi
	
	jmp punere_valori
	
	
	;; daca numarul la care se imparte e 0 se sare la urmatorul
verificare_dif_0:
	inc esi
	xor eax, eax
	pop eax
	jmp punere_valori
	
	
terminare:
	
	;; Your code ends here
	
	;; DO NOT MODIFY
	popa
	leave
	ret
	;; DO NOT MODIFY
