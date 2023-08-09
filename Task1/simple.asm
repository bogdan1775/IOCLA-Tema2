%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here


    ;; la fiecare litera aduna step
transformare:
    xor ebx, ebx
    mov bl, byte [esi + ecx -1]
    add ebx, edx
    
    ;; se verifica daca il depaseste pe Z
    cmp ebx, 90
    jg  decrementare


    ;; se pune fiecare litera tansformata in enc_string
atribuire:
    mov byte [edi +ecx -1], bl
    dec ecx

    cmp ecx, 0
    jne transformare
    jmp terminare


    ;; daca litera il depaseste pe Z se scade 26 (nr de litere)
decrementare:
    sub ebx, 26
    jmp atribuire


    ;; s-a terminat transformarea
terminare:


    ;; Your code ends here
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
