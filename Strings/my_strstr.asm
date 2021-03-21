%include "io.mac"


section .text
    global my_strstr
    extern printf

my_strstr:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edi, [ebp + 8]      ; substr_index
    mov     esi, [ebp + 12]     ; haystack
    mov     ebx, [ebp + 16]     ; needle
    mov     ecx, [ebp + 20]     ; haystack_len
    mov     edx, [ebp + 24]     ; needle_len
    ;; DO NOT MODIFY

    ;; TO DO: Implement my_strstr

    lea esi, [esi]      ;sir
    lea ebx, [ebx]      ;subsir
    mov [length], ecx   ;strlen(sir)

    cmp edx, 0x1            ;daca subsirul are o singura litera
    je o_litera             ;iau un caz partiucular
    jmp while_loop

    o_litera:
        xor eax, eax
        mov al, byte[esi]               ;iterez prin sir
        cmp al, byte[ebx]               ;iau caracterul din subsir
        je out                          ;finalizez
        inc esi                         ;iterez
        loop o_litera
    while_loop:
        mov eax, dword[esi]              ;iterez in sir
        cmp eax, dword[ebx]              ;compar sir[i], subsir[0]
        je pregateste_while              ;fac initializari
        inc esi
        loop while_loop
    pregateste_while:
        lea ebp, [ebx]                   ;pastrez adresa subsirului
        mov eax, esi                     ;copie sir
        lea eax, [eax]                   ;adresa la care este copia sirului
        mov [lungime_subsir], edx        ;lungime subsir
        sub dword[lungime_subsir], 1     ;strle(subsir)--  pentru ca am verificat
                                         ;deja primul caracter
        inc ebp                          ;iterez in subsir 
        inc eax                          ;iterez sir
        jmp while2_loop                   
    while2_loop:
        mov dl, byte[eax]                ;sir[strlen(subsir) - 1]
        cmp dl, byte[ebp]                ;compar elementele
        jne while_loop                   ;daca este unul gresit, continui sa caut
        sub dword[lungime_subsir], 1     ;scade dimensiunea subsirului
        inc eax                          ;iterez
        inc ebp
        cmp dword[lungime_subsir], 0     ;daca mai am elemente de comparat, continui
        jg while2_loop                   
        jmp out                          ;am gasit tot subsirul, ies
    out: 
        xor eax, eax
        cmp ecx, eax                     ;daca nu am gasit subsirul
        jl nu_exista
        sub [length], ecx                ;iau marimea ce trebuie returnata
        mov al, byte[length]
        mov [edi], eax
        jmp iesire
    nu_exista:
        mov al, byte[length]             ;intorc lungimea sirului + 1
        add eax, 1
        mov [edi], eax
    iesire:                               ;o folosesc da sa nu intre in "nu_exista"

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY

    section .data
        length dd 0
        lungime_subsir dd 0