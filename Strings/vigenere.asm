%include "io.mac"

section .data
    counter dd 0
    lungime_sir dd 0
    lungime_cheie dd 0
    type db 0       ;este 0 daca plaintext[i] este litera mica
                    ;si 1 daca este litera mare
section .text
    global vigenere
    extern printf

vigenere:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext             str 
    mov     ecx, [ebp + 16]     ; plaintext_len         strlen(str)        Ana are mere
    mov     edi, [ebp + 20]     ; key                   cheie       aba    aba aba    
    mov     ebx, [ebp + 24]     ; key_len               strlen(cheie)
    ;; DO NOT MODIFY

    ;; TODO: Implement the Vigenere cipher

    xor ebp, ebp                            ;indexul cu care iterez prin cheie
    
    xor eax, eax                            ;variabila auxiliara la iterare
    mov dword[counter], 0x0
    mov dword[lungime_cheie], ebx           ;strlen(key)
    mov dword[lungime_sir], ecx             ;strlen(sir)
    xor ecx, ecx

    label:
    	mov byte[type], 0 					;litera mica
        xor eax, eax
        mov al, byte[esi + ecx]           	;eax = text[i]   
        cmp eax, 'a'              			;posibil sa fie litera mica
        jge posibil_mica
        cmp eax, 'Z'              			;posibil sa fie litera mare
        jle posibil_mare
        jmp scrie             				;daca nu e litera, nu modific
    posibil_mica:
        cmp eax, 'z'              			;sigur este litera mica
        jle completeaza_cheie_mica   
        jmp scrie                                    
    posibil_mare:
        cmp al, 'A'              			;sigur este litera mare
        jge completeaza_cheie_mare
        jmp scrie
    completeaza_cheie_mica:
        sub eax, 'a' 
        add eax, 0x20                       ;tolower(key[i])
        jmp completeaza_cheie
    completeaza_cheie_mare:
        mov byte[type], 0x1                 ;setez tipul cheii in type
        sub eax, 'A'
    completeaza_cheie:
        cmp dword[lungime_cheie], ebp                         
        jle resetare                        ;am ajuns la finalul cheii
        xor ebx, ebx
        mov bl, byte[edi + ebp]             ;iau caracterul corespunzator din cheie
        inc ebp                             ;creste indexul in cheie
        add eax, ebx     			        ;il adun la restul calculului 
        cmp byte[type], 0x0                 ;daca text[i] este litera mica
        je verifica_mica                    ;verific daca a iesit din alfabet
        jmp verifica_mare
    verifica_mare:
    	cmp eax, 'Z'
    	jg scade_mare
    	jmp scrie
    verifica_mica:
    	cmp eax, 'z'
    	jg scade_mica
    	jmp scrie
    scade_mica:             ;scad succesiv 26 din numar pentru a ajunge la o valare din alfabet             
    	sub eax, 0x1A
    	cmp eax, 'z'
    	jg scade_mica
    	jmp scrie
    scade_mare:
    	sub eax, 0x1A
    	cmp eax, 'Z'
    	jg scade_mica
    	jmp scrie
    scrie:
        mov byte[edx + ecx], al     		;il pun in edx
        inc ecx                             ;creste numarul de elemente din edx
        jmp itereaza
    resetare:
        xor ebp, ebp                        ;indexul cheii = 0
        jmp completeaza_cheie
    itereaza:
        cmp ecx, dword[lungime_sir]         ;verific daca noul sir are lungimea vechiului sir
        jl label

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY