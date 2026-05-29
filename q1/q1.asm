.list
.include "m328Pdef.inc"
.nolist
.equ DISPLAY = PORTD
.def AUX = R16
.ORG 0x000
Inicio:
    LDI AUX, 0xFF
    OUT DDRD, AUX
Principal:
    LDI AUX, 0x0D ; Letra
    RCALL Decodifica
    RJMP Principal
Decodifica:
    CPI AUX, 0x00
    BRNE nao_0
    RJMP CASE_0
nao_0:
    CPI AUX, 0x01
    BRNE nao_1
    RJMP CASE_1
nao_1:
    CPI AUX, 0x02
    BRNE nao_2
    RJMP CASE_2
nao_2:
    CPI AUX, 0x03
    BRNE nao_3
    RJMP CASE_3
nao_3:
    CPI AUX, 0x04
    BRNE nao_4
    RJMP CASE_4
nao_4:
    CPI AUX, 0x05
    BRNE nao_5
    RJMP CASE_5
nao_5:
    CPI AUX, 0x06
    BRNE nao_6
    RJMP CASE_6
nao_6:
    CPI AUX, 0x07
    BRNE nao_7
    RJMP CASE_7
nao_7:
    CPI AUX, 0x08
    BRNE nao_8
    RJMP CASE_8
nao_8:
    CPI AUX, 0x09
    BRNE nao_9
    RJMP CASE_9
nao_9:
    CPI AUX, 0x0A
    BRNE nao_A
    RJMP CASE_A
nao_A:
    CPI AUX, 0x0B
    BRNE nao_B
    RJMP CASE_B
nao_B:
    CPI AUX, 0x0C
    BRNE nao_C
    RJMP CASE_C
nao_C:
    CPI AUX, 0x0D
    BRNE nao_D
    RJMP CASE_D
nao_D:
    RET
CASE_0:
    LDI ZH, HIGH(Tabela<<1)
    LDI ZL, LOW(Tabela<<1)
    ADD ZL, AUX
    BRCC le_tab_0
    INC ZH
le_tab_0:
    LPM R0, Z
    OUT DISPLAY, R0
    RET
CASE_1:
    LDI ZH, HIGH(Tabela<<1)
    LDI ZL, LOW(Tabela<<1)
    ADD ZL, AUX
    BRCC le_tab_1
    INC ZH
le_tab_1:
    LPM R0, Z
    OUT DISPLAY, R0
    RET
CASE_2:
    LDI ZH, HIGH(Tabela<<1)
    LDI ZL, LOW(Tabela<<1)
    ADD ZL, AUX
    BRCC le_tab_2
    INC ZH
le_tab_2:
    LPM R0, Z
    OUT DISPLAY, R0
    RET
CASE_3:
    LDI ZH, HIGH(Tabela<<1)
    LDI ZL, LOW(Tabela<<1)
    ADD ZL, AUX
    BRCC le_tab_3
    INC ZH
le_tab_3:
    LPM R0, Z
    OUT DISPLAY, R0
    RET
CASE_4:
    LDI ZH, HIGH(Tabela<<1)
    LDI ZL, LOW(Tabela<<1)
    ADD ZL, AUX
    BRCC le_tab_4
    INC ZH
le_tab_4:
    LPM R0, Z
    OUT DISPLAY, R0
    RET
CASE_5:
    LDI ZH, HIGH(Tabela<<1)
    LDI ZL, LOW(Tabela<<1)
    ADD ZL, AUX
    BRCC le_tab_5
    INC ZH
le_tab_5:
    LPM R0, Z
    OUT DISPLAY, R0
    RET
CASE_6:
    LDI ZH, HIGH(Tabela<<1)
    LDI ZL, LOW(Tabela<<1)
    ADD ZL, AUX
    BRCC le_tab_6
    INC ZH
le_tab_6:
    LPM R0, Z
    OUT DISPLAY, R0
    RET
CASE_7:
    LDI ZH, HIGH(Tabela<<1)
    LDI ZL, LOW(Tabela<<1)
    ADD ZL, AUX
    BRCC le_tab_7
    INC ZH
le_tab_7:
    LPM R0, Z
    OUT DISPLAY, R0
    RET
CASE_8:
    LDI ZH, HIGH(Tabela<<1)
    LDI ZL, LOW(Tabela<<1)
    ADD ZL, AUX
    BRCC le_tab_8
    INC ZH
le_tab_8:
    LPM R0, Z
    OUT DISPLAY, R0
    RET
CASE_9:
    LDI ZH, HIGH(Tabela<<1)
    LDI ZL, LOW(Tabela<<1)
    ADD ZL, AUX
    BRCC le_tab_9
    INC ZH
le_tab_9:
    LPM R0, Z
    OUT DISPLAY, R0
    RET
CASE_A:
    LDI ZH, HIGH(Tabela<<1)
    LDI ZL, LOW(Tabela<<1)
    ADD ZL, AUX
    BRCC le_tab_A
    INC ZH
le_tab_A:
    LPM R0, Z
    OUT DISPLAY, R0
    RET
CASE_B:
    LDI ZH, HIGH(Tabela<<1)
    LDI ZL, LOW(Tabela<<1)
    ADD ZL, AUX
    BRCC le_tab_B
    INC ZH
le_tab_B:
    LPM R0, Z
    OUT DISPLAY, R0
    RET
CASE_C:
    LDI ZH, HIGH(Tabela<<1)
    LDI ZL, LOW(Tabela<<1)
    ADD ZL, AUX
    BRCC le_tab_C
    INC ZH
le_tab_C:
    LPM R0, Z
    OUT DISPLAY, R0
    RET
CASE_D:
    LDI ZH, HIGH(Tabela<<1)
    LDI ZL, LOW(Tabela<<1)
    ADD ZL, AUX
    BRCC le_tab_D
    INC ZH
le_tab_D:
    LPM R0, Z
    OUT DISPLAY, R0
    RET

Tabela:
    .dw 0x5C39  ; [1]o=0x5C  [0]C=0x39
    .dw 0x7773  ; [3]a=0x77  [2]p=0x73
    .dw 0x5E00  ; [5]d=0x5E  [4]' '=0x00
    .dw 0x507C  ; [7]r=0x50  [6]b=0x7C
    .dw 0x306D  ; [9]i=0x30  [8]s=0x6D
    .dw 0x5B38  ; [B]2=0x5B  [A]l=0x30
    .dw 0x7D3F  ; [D]6=0x7D  [C]0=0x3F