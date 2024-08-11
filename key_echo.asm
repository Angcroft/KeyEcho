;   Assembly Keyboard Echo
;   This program captures keyboard input and shows to the screen in realtime

.model small
.stack 100h
.data

.code
main:
    ;   Initialize data segment
    mov ax, @data
    mov ds, ax

    ;   Main loop
main_loop:
    ;   Wait for key and store it in AL
    mov ah, 1   ;   Function 1 of INT 16h: Checks if key is pressed
    int 16h     ;   Calls key interruption
    jz main_loop    ;   If no key, continue loop

    ;   Captures the pressed key
    mov ah, 0   ;   Function 0 of INT 16h: Reads key from keyboard
    int 16h     ;   Calls key interruption
    ;   AL contains the ASCII code of pressed key

    ;   Prints character to screen
    mov ah, 0Eh     ;   Function 0Eh of INT 10h: Show character to screen
    int 10h         ;   Calls screen interruption

    ;   Jump lines automatically
    mov al, 0Dh     ;   Ascii Code of 'Enter' (Carriage Return)
    int 10h         ;   Shows Enter

    mov al, 0Ah     ;   Ascii code of 'Line Feed'
    int 10h

    ;   If ESC is pressed, exit the program
    cmp al, 18h
    je exit_program

    ;   Returns to main loop
    jmp main_loop

exit_program:
    ;   Finishes program and returns to DOS
    mov ah, 4Ch
    int 21h
end main