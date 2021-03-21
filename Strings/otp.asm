%include "io.mac"

section .text
    global otp
    extern printf

otp:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     edx, [ebp + 8]      ; ciphertext
    mov     esi, [ebp + 12]     ; plaintext
    mov     edi, [ebp + 16]     ; key
    mov     ecx, [ebp + 20]     ; length
    ;; DO NOT MODIFY

    ;; TODO: Implement the One Time Pad cipher
    ;retin adresele din memorie de la fiecare
    lea edx, [edx]  
    lea esi, [esi]
    lea edi, [edi]

    enc_loop:
    	mov al, byte[esi]      ;iau un byte din text
    	xor al, byte[edi]      ;fac text[i] ^ key[i]
    	mov byte[edx], al      ;trec rezultatul in edx
    	inc edx                ;iterez prin siruri
    	inc esi
    	inc edi
    	loop enc_loop
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY