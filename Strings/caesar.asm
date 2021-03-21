%include "io.mac"

section .text
    global caesar
    extern printf

caesar:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

    ;; TODO: Implement the caesar cipher

    mov ebx, edi                 ;pastrez cheia in ebx
   

    label:
        xor eax, eax             ;eax = 0
        mov al, [esi + ecx - 1]  ;eax = text[i]
        cmp al, 'a'              ;posibil sa fie litera mica
        jge posibil_mica
        cmp al, 'Z'              ;posibil sa fie litera mare
        jle posibil_mare
        jmp itereaza             ;daca nu e litera, nu modific
    posibil_mica:
        cmp al, 'z'              ;sigur este litera mica
        jle cripteaza_mica
        jmp itereaza
    posibil_mare:
        cmp al, 'A'              ;sigur este litera mare
        jge cripteaza_mare
        jmp itereaza
    cripteaza_mica:
        add eax, ebx             ;adun cheie                     
        cmp eax, 'z'             ;daca a depasit alfabetul
        jg modifica_mica
        jmp itereaza
    cripteaza_mare:
        add eax, ebx             ;adun cheia
        cmp eax , 'Z'            ;a depasit alfabetul
        jg modifica_mare
        jmp itereaza
    modifica_mica:               ;modific litera, astfel incat literele mici sa ramana mici
        sub eax, 'z'            
        add eax, 'a'
        sub eax, 1
        cmp eax, 'z'             ;verific daca noul caracter ese incadreaza in literele cerute
        jg modifica_mica            
        jmp itereaza             ;litera este in alfabet, o pun in textul criptat si trec mai departe
    modifica_mare:               ;modific litera, astfel incat literele mici sa ramana mici
        sub eax, 'Z'
        add eax, 'A'
        sub eax, 1
        cmp eax, 'Z'              ;verificare daca este litera mare
        jg modifica_mare
        jmp itereaza
    itereaza:
        mov byte[edx + ecx - 1], al ;mut in edx
        sub ecx, 1                  ;iterez
        cmp ecx, 0
        jg label

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY