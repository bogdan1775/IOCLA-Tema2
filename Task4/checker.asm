section .data
	
section .text
	global checkers
	
checkers:
	;; DO NOT MODIFY
	push ebp
	mov ebp, esp
	pusha
	
	mov eax, [ebp + 8]  ; x
	mov ebx, [ebp + 12] ; y
	mov ecx, [ebp + 16] ; table
	
	;; DO NOT MODIFY
	;; FREESTYLE STARTS HERE
	
	
	;; vecinul din stanga jos
primul_vecin:
	sub eax, 1
	
	;; se verifica daca iese de matrice
	cmp eax, 0
	jl verificare_linie_jos
	
	sub ebx, 1
	
	;; se verifica daca iese de matrice
	cmp ebx, 0
	jl verificare_coloana_st_jos
	
	
	;; se retine in edx pozitia in care trebuie sa inseram
	xor edx, edx
	mov edx, eax
	imul edx, 8
	
	
	add edx, ebx
	mov dword [ecx + edx], 1
	
	;; se reface pozitia inapoi pentru coloana
	add ebx, 1
	

    ;; vecinul din dreapta jos
al_doilea_vecin:
	add ebx, 1

    ;; se verifica daca iese de matrice
	cmp ebx, 7
	jg verificare_coloana_dr_jos
	
    ;; se retine in edx pozitia in care trebuie sa inseram
	xor edx, edx
	mov edx, eax
	imul edx, 8
	
	add edx, ebx
	mov dword [ecx + edx], 1
	
	;refacere pozitie initiala
	add eax, 1
	sub ebx, 1
	

    ;; vecinul din stanga sus
al_treilea_vecin:
	add eax, 1

    ;; se verifica daca iese de matrice
	cmp eax, 7
	jg verificare_linie_sus

	sub ebx, 1

    ;; se verifica daca iese de matrice
	cmp ebx, 0
	jl verificare_coloana_st_sus
	

    ;; se retine in edx pozitia in care trebuie sa inseram
	xor edx, edx
	mov edx, eax
	imul edx, 8
	
	add edx, ebx
	mov dword [ecx + edx], 1
	
	;; se reface pozitia inapoi pentru coloana
	add ebx, 1
	

	;; vecinul din dreapta sus
al_patrulea_vecin:
	add ebx, 1

    ;; se verifica daca iese de matrice
	cmp ebx, 7
	jg verificare_coloana_dr_sus
	
    ;; se retine in edx pozitia in care trebuie sa inseram
	xor edx, edx
	mov edx, eax
	imul edx, 8
	
	add edx, ebx
	mov dword [ecx + edx], 1
	
	jmp terminare
	
	
verificare_linie_jos:
	add eax, 1
	jmp al_treilea_vecin
	

verificare_coloana_st_jos:
	add ebx, 1
	jmp al_doilea_vecin
	

verificare_coloana_dr_jos:
	sub ebx, 1
	add eax, 1
	jmp al_treilea_vecin
	

verificare_linie_sus:
	jmp terminare
	

verificare_coloana_st_sus:
	add ebx, 1
	jmp al_patrulea_vecin
	

verificare_coloana_dr_sus:
	jmp terminare
	
	
terminare:
	
	;; FREESTYLE ENDS HERE
	;; DO NOT MODIFY
	popa
	leave
	ret
	;; DO NOT MODIFY
