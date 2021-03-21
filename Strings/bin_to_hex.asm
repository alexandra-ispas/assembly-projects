%include "io.mac"

section .data
    lungime_sir dd 0
section .text
    global bin_to_hex
    extern printf

bin_to_hex:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; hexa_value
    mov     esi, [ebp + 12]     ; bin_sequence
    mov     ecx, [ebp + 16]     ; length                    ;il folosesc
    ;; DO NOT MODIFY

    ;; TODO: Implement bin to hex

    xor eax, eax                    ;auxiliar
    xor ebx, ebx                    ;auxiliar de iterat prin sirul binar
    xor edi, edi                    ;lungimea noului sir
    mov dword[lungime_sir], ecx     ;salvez lungimea sirului binar

    lungimea_noului_sir:                ;vreau sa aflu cate grupe de 4 biti sunt
        mov bl, byte[esi + ecx - 1]     ;iterez in sir
        dec ecx                         ;scade lungimea sirului
        inc eax                         ;numara pana la 4
        cmp eax, 4                      ;daca am numarat 4 biti consecutivi
        je grup
        cmp ecx, 0
        jg lungimea_noului_sir
        cmp eax, 0x0
        jg extra
    grup:                               ;adauga un grup de biti
        xor eax, eax                    ;reseteaza nr de biti consecutivi
        inc edi                         ;nr de grupuri++
        cmp ecx, 0                      ;daca nu mai am elemente in sir
        jg lungimea_noului_sir
        jmp reinitializari
    extra:                               ;nu mai am elemente in sir
        inc edi                          ;dar am mai gasit mai putin de 3 biti
    reinitializari:                      ;modifc sa pot itera iar prin sir
        mov byte[edx + edi], 0x0A        ;pun '\n' la finalul noului sir
        xor eax, eax
        xor ebx, ebx  
        mov ecx, dword[lungime_sir] 
    iterare_peste_grupuri:
        mov bl, byte[esi + ecx - 1]      ;iterez in sir
        dec ecx         
        cmp bl, '1'                      ;daca am gasit bitul 1
        je _unu
        jmp _zero  
    _unu:
        mov bl, byte[esi + ecx - 1]
        dec ecx
        cmp bl, '1'
        je _unu_unu
        jmp _zero_unu
    _zero:
        mov bl, byte[esi + ecx - 1]
        dec ecx
        cmp bl, '1'
        je _unu_zero
        jmp _zero_zero
    _unu_unu:
        mov bl, byte[esi + ecx - 1]
        dec ecx
        cmp bl, '1'
        je _unu_unu_unu
        jmp _zero_unu_unu
    _unu_zero: 
        mov bl, byte[esi + ecx - 1]
        dec ecx
        cmp bl, '1'
        je _unu_unu_zero
        jmp _zero_unu_zero
    _zero_unu:
        mov bl, byte[esi + ecx - 1]
        dec ecx
        cmp bl, '1'
        je _unu_zero_unu
        jmp _zero_zero_unu
    _zero_zero:
        mov bl, byte[esi + ecx - 1]
        dec ecx
        cmp bl, '1'
        je _unu_zero_zero
        jmp _zero_zero_zero
    _unu_unu_unu:
        mov bl, byte[esi + ecx - 1]
        dec ecx
        cmp bl, '1'
        je _unu_unu_unu_unu         
        jmp _zero_unu_unu_unu        
    _unu_unu_zero:
        mov bl, byte[esi + ecx - 1]
        dec ecx
        cmp bl, '1'
        je _unu_unu_unu_zero
        jmp _zero_unu_unu_zero
     _unu_zero_unu:
        mov bl, byte[esi + ecx - 1]
        dec ecx
        cmp bl, '1'
        je _unu_unu_zero_unu       
        jmp _zero_unu_zero_unu      
    _zero_unu_unu:
        mov bl, byte[esi + ecx - 1]
        dec ecx
        cmp bl, '1'
        je _unu_zero_unu_unu         
        jmp _zero_zero_unu_unu       
    _unu_zero_zero:
        mov bl, byte[esi + ecx - 1]
        dec ecx
        cmp bl, '1'
        je _unu_unu_zero_zero         
        jmp _zero_unu_zero_zero       
    _zero_unu_zero:
        mov bl, byte[esi + ecx - 1]
        dec ecx
        cmp bl, '1'
        je _unu_zero_unu_zero        
        jmp _zero_zero_unu_zero      
    _zero_zero_unu:
        mov bl, byte[esi + ecx - 1]
        dec ecx
        cmp bl, '1'
        je _unu_zero_zero_unu       
        jmp _zero_zero_zero_unu     
    _zero_zero_zero:
        mov bl, byte[esi + ecx - 1]
        dec ecx
        cmp bl, '1'
        je _unu_zero_zero_zero        
        jmp _zero_zero_zero_zero      
    _unu_unu_unu_unu:
        mov byte[edx + edi - 1], 'F'
        jmp itereaza
    _unu_unu_unu_zero:
        mov byte[edx + edi - 1], 'E'
        jmp itereaza
    _unu_unu_zero_unu:
        mov byte[edx + edi - 1], 'D'
        jmp itereaza
    _unu_unu_zero_zero:
        mov byte[edx + edi - 1], 'C'
        jmp itereaza
    _unu_zero_unu_unu:
        mov byte[edx + edi - 1], 'B'
        jmp itereaza,
    _unu_zero_unu_zero:
        mov byte[edx + edi - 1], 'A'
        jmp itereaza
    _unu_zero_zero_unu:
        mov byte[edx + edi - 1], 0x39
        jmp itereaza
    _unu_zero_zero_zero:
        mov byte[edx + edi - 1], 0x38
        jmp itereaza
    _zero_unu_unu_unu:
        mov byte[edx + edi - 1], 0x37
        jmp itereaza
    _zero_unu_unu_zero:
        mov byte[edx + edi - 1], 0x36
        jmp itereaza
    _zero_unu_zero_unu:
        mov byte[edx + edi - 1], 0x35
        jmp itereaza
    _zero_unu_zero_zero:
        mov byte[edx + edi-1], 0x34
        jmp itereaza
    _zero_zero_unu_unu:
        mov byte[edx + edi-1], 0x33
        jmp itereaza
    _zero_zero_unu_zero:
        mov byte[edx + edi-1], 0x32
        jmp itereaza
    _zero_zero_zero_unu:
        mov byte[edx + edi - 1], 0x31
        jmp itereaza
    _zero_zero_zero_zero:
        mov byte[edx + edi - 1], 0x30
        jmp itereaza
    itereaza:
        dec edi
        cmp ecx, 0
        jg iterare_peste_grupuri

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY