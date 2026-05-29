.list
.include "m328Pdef.inc"
.nolist

.equ DISP_DEZ  = PORTC
.equ DISP_UNI  = PORTD
.equ BTN_DEC   = PB0
.equ BTN_INC   = PB1
.equ BTN_ZERO  = PB2

.def AUX     = R16
.def DEZENA  = R17
.def UNIDADE = R18

.ORG 0x000

Inicializacoes:
    LDI AUX, 0xFF
    OUT DDRC, AUX
    OUT DDRD, AUX
    LDI AUX, 0x00
    OUT DDRB, AUX
    LDI AUX, 0b00000111
    OUT PORTB, AUX
    LDI DEZENA,  0
    LDI UNIDADE, 0

Principal:
    RCALL Mostrar_Display
    SBIS PINB, BTN_ZERO
    RJMP Zerar
    SBIS PINB, BTN_INC
    RJMP Incrementar
    SBIS PINB, BTN_DEC
    RJMP Decrementar
    RJMP Principal

Zerar:
    LDI DEZENA,  0
    LDI UNIDADE, 0
    RCALL Debounce
    RJMP Principal

Incrementar:
    INC  UNIDADE
    CPI  UNIDADE, 10
    BRLO Inc_Fim
    LDI  UNIDADE, 0
    INC  DEZENA
    CPI  DEZENA, 6
    BRLO Inc_Fim
    LDI  DEZENA, 0
Inc_Fim:
    RCALL Debounce
    RJMP  Principal

Decrementar:
    MOV  AUX, DEZENA
    OR   AUX, UNIDADE
    BREQ Dec_Wrap
    DEC  UNIDADE
    CPI  UNIDADE, 0xFF
    BRNE Dec_Fim
    LDI  UNIDADE, 9
    DEC  DEZENA
Dec_Fim:
    RCALL Debounce
    RJMP  Principal
Dec_Wrap:
    LDI  DEZENA,  5
    LDI  UNIDADE, 9
    RCALL Debounce
    RJMP  Principal

Mostrar_Display:
    LDI ZH, HIGH(Tabela<<1)
    LDI ZL, LOW(Tabela<<1)
    ADD ZL, UNIDADE
    BRCC uni_ok
    INC ZH
uni_ok:
    LPM AUX, Z
    OUT DISP_UNI, AUX

    LDI ZH, HIGH(Tabela<<1)
    LDI ZL, LOW(Tabela<<1)
    ADD ZL, DEZENA
    BRCC dez_ok
    INC ZH
dez_ok:
    LPM AUX, Z
    OUT DISP_DEZ, AUX
    RET

Debounce:
    RCALL Atraso
Deb_Loop:
    IN   AUX, PINB
    ANDI AUX, 0b00000111
    CPI  AUX, 0b00000111
    BRNE Deb_Loop
    RCALL Atraso
    RET

Atraso:
    LDI R19, 16
volta:
    DEC  R20
    BRNE volta
    DEC  R21
    BRNE volta
    DEC  R19
    BRNE volta
    RET

Tabela:
    .dw 0x063F  ; [1]=0x06(1)  [0]=0x3F(0)
    .dw 0x4F5B  ; [3]=0x4F(3)  [2]=0x5B(2)
    .dw 0x6D66  ; [5]=0x6D(5)  [4]=0x66(4)
    .dw 0x077D  ; [7]=0x07(7)  [6]=0x7D(6)
    .dw 0x6F7F  ; [9]=0x6F(9)  [8]=0x7F(8)