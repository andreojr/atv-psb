.list
.include "m328Pdef.inc"
.nolist

.equ DISPLAY = PORTD
.def AUX    = R16
.def LINHA  = R17
.def COLUNA = R18

.ORG 0x000

Inicializacoes:
    LDI AUX, 0xFF
    OUT DDRD, AUX

    LDI LINHA,  1    ; <- alterar aqui (0 a 3)
    LDI COLUNA, 2    ; <- alterar aqui (0 a 3)

Principal:
    RCALL Calcular
    RCALL Decodifica
    RJMP Principal

Calcular:
    ; AUX = LINHA*4 + COLUNA
    MOV  AUX, LINHA
    LSL  AUX            ; AUX = LINHA*2
    LSL  AUX            ; AUX = LINHA*4
    ADD  AUX, COLUNA    ; AUX = LINHA*4 + COLUNA
    RET

Decodifica:
    LDI ZH, HIGH(Tabela<<1)
    LDI ZL, LOW(Tabela<<1)
    ADD ZL, AUX
    BRCC le_tab
    INC ZH
le_tab:
    LPM R0, Z
    OUT DISPLAY, R0
    RET

Tabela:
    ; linha 0: [1]=1   [0]=0   [3]=3   [2]=2
    .dw 0x063F, 0x4F5B  ; 0=0x3F, 1=0x06, 2=0x5B, 3=0x4F
    ; linha 1: [5]=5   [4]=4   [7]=7   [6]=6
    .dw 0x6D66, 0x077D  ; 4=0x66, 5=0x6D, 6=0x7D, 7=0x07
    ; linha 2: [9]=9   [8]=8   [B]=B   [A]=A
    .dw 0x6F7F, 0x7C77  ; 8=0x7F, 9=0x6F, A=0x77, B=0x7C
    ; linha 3: [D]=D   [C]=C   [F]=F   [E]=E
    .dw 0x5B39, 0x7171  ; C=0x39, D=0x5B, E=0x79, F=0x71