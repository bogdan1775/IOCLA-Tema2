%include "../include/io.mac"

section .data

section .text
    global bonus

bonus:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]	; x
    mov ebx, [ebp + 12]	; y
    mov ecx, [ebp + 16] ; board

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE
	
	
	;; vecinul din stanga jos
primul_vecin:
	sub eax, 1
	
	;; se verifica daca iese de matrice
	cmp eax, 0
	jl verificare_linie_jos
	
	;; se verifica daca iese de matrice
	sub ebx, 1
	cmp ebx, 0
	jl verificare_coloana_st_jos
	
	;; se retine in edx pozitia in care ar trebui sa inseram
	xor edx, edx
	mov edx, eax
	imul edx, 8
	add edx, ebx
	
	xor edi, edi
	mov edi, 1
	
	;; se calculeaza in funtie de edx ce bit sa il facem 1 si pentru cine
	cmp edx, 32
	jl calculare_putere2_board1_1

	sub edx, 32
	jmp calculare_putere2_board0_1
	

	;; inserare board[1] pentru vecinul din stanga jos
inserare1_board1:
	add [ecx + 4], edi
	
	add ebx, 1
	jmp al_doilea_vecin
	
	
	;; inserare board[0] pentru vecinul din stanga jos
inserare1_board0:
	add [ecx], edi
	
	add ebx, 1
	jmp al_doilea_vecin
	
	
	;; vecinul din dreapta jos
al_doilea_vecin:
	add ebx, 1
	
	;; se verifica daca iese de matrice
	cmp ebx, 7
	jg verificare_coloana_dr_jos
	
	;; se retine in edx pozitia in care ar trebui sa inseram
	xor edx, edx
	mov edx, eax
	imul edx, 8
	add edx, ebx
	
	xor edi, edi
	mov edi, 1
	
	;; se calculeaza in funtie de edx ce bit sa il facem 1 si pentru cine
	cmp edx, 32
	jl calculare_putere2_board1_2

	sub edx, 32
	jmp calculare_putere2_board0_2
	
	
	;; inserare board[1] pentru vecinul din dreapta jos
inserare2_board1:
	add [ecx + 4], edi
	
	;refacere pozitie initiala
	add eax, 1
	sub ebx, 1
	
	jmp al_treilea_vecin
	
	
	;; inserare board[0] pentru vecinul din dreapta jos
inserare2_board0:
	add [ecx], edi
	
	;refacere pozitie initiala
	add eax, 1
	sub ebx, 1
	
	jmp al_treilea_vecin
	

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
	
	;; se retine in edx pozitia in care ar trebui sa inseram
	xor edx, edx
	mov edx, eax
	imul edx, 8
	add edx, ebx
	
	xor edi, edi
	mov edi, 1
	
	;; se calculeaza in funtie de edx ce bit sa il facem 1 si pentru cine
	cmp edx, 32
	jl calculare_putere2_board1_3

	sub edx, 32
	jmp calculare_putere2_board0_3
	

    ;; inserare board[1] pentru vecinul din stanga sus
inserare3_board1:
	add [ecx + 4], edi
	add ebx, 1

	jmp al_patrulea_vecin
	
    ;; inserare board[0] pentru vecinul din stanga sus
inserare3_board0:
	add [ecx], edi
	
	add ebx, 1
	jmp al_patrulea_vecin
	
	
	;; vecinul din dreapta sus
al_patrulea_vecin:
	add ebx, 1
	
	;; se verifica daca iese de matrice
	cmp ebx, 7
	jg verificare_coloana_dr_sus
	
	;; se retine in edx pozitia in care ar trebui sa inseram
	xor edx, edx
	mov edx, eax
	imul edx, 8
	add edx, ebx
	
	xor edi, edi
	mov edi, 1
	
	;; se calculeaza in funtie de edx ce bit sa il facem 1 si pentru cine
	cmp edx, 32
	jl calculare_putere2_board1_4

	sub edx, 32
	jmp calculare_putere2_board0_4
	
    ;; inserare board[1] pentru vecinul din dreapta sus
inserare4_board1:
	add [ecx + 4], edi
	jmp terminare
	
    ;; inserare board[0] pentru vecinul din dreapta sus
inserare4_board0:
	add [ecx], edi
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
	
	
    
	;; pentru vecinii stanga jos
calculare_putere2_board1_1:
	dec edx
	cmp edx, 0
	jl inserare1_board1
	
	shl edi, 1
	jmp calculare_putere2_board1_1
	
calculare_putere2_board0_1:
	dec edx
	cmp edx, 0
	jl inserare1_board0
	shl edi, 1
	jmp calculare_putere2_board0_1
	
	
	;; pentru vecinii dreapta jos
calculare_putere2_board1_2:
	dec edx
	cmp edx, 0
	jl inserare2_board1
	shl edi, 1
	jmp calculare_putere2_board1_2
	
calculare_putere2_board0_2:
	dec edx
	cmp edx, 0
	jl inserare2_board0
	shl edi, 1
	jmp calculare_putere2_board0_2
	
	
	;; pentru vecinii stanga sus
calculare_putere2_board1_3:
	dec edx
	cmp edx, 0
	jl inserare3_board1
	shl edi, 1
	jmp calculare_putere2_board1_3
	
calculare_putere2_board0_3:
	dec edx
	cmp edx, 0
	jl inserare3_board0
	shl edi, 1
	jmp calculare_putere2_board0_3
	
	
	;; pentru vecinii dreapta sus
calculare_putere2_board1_4:
	dec edx
	cmp edx, 0
	jl inserare4_board1
	shl edi, 1
	jmp calculare_putere2_board1_4
	
calculare_putere2_board0_4:
	dec edx
	cmp edx, 0
	jl inserare4_board0
	shl edi, 1
	jmp calculare_putere2_board0_4
	
	
	
terminare:
	
	;; FREESTYLE ENDS HERE
	;; DO NOT MODIFY
	popa
	leave
	ret
	;; DO NOT MODIFY
