; ALLOWS ONE TO START THE APPLICATION WITH RUN
; SYS 2064
*=$0801 
         BYTE $0C, $8, $0A, $00, $9E, $20, $32, $30, $36, $34, $00, $00, $00, $00, $00

CLEAR           = $E544

SPR_ENABLE      = $D015
SPR_MSBX        = $D010
SPR_COLORMODE   = $D01C
SPR_COLOR0      = $D025
SPR_COLOR1      = $D026

SPR0_PTR        = $07F8
SPR0_X          = $D000
SPR0_Y          = $D001
SPR0_COLOR      = $D027
SPR0_DATA       = $0340

INIT    JSR CLEAR

        ; ENABLE SPRITES
        LDA #%00000001
        STA SPR_ENABLE

        ; SET COLOR MODES
        LDA #%00000001
        STA SPR_COLORMODE

        ; SET SPRITE COLORS 0,12,15
        LDA #0
        STA SPR0_COLOR
        LDA #12
        STA SPR_COLOR0
        LDA #15
        STA SPR_COLOR1

        ; SET SPRITE X = 0*255 + 100
        LDX #%00000000
        STX SPR_MSBX
        LDX #100
        STX SPR0_X

        ; SET SPRITE Y = 100
        LDY #100
        STY SPR0_Y

        ; SET SPRITE POINTER
        LDA #$0D
        STA SPR0_PTR

        ; LOAD SPRITE0 DATA
        LDX #0
LOAD    LDA BOX,X
        STA SPR0_DATA,X
        INX
        CPX #63
        BNE LOAD
       
LOOP    JMP LOOP

BOX     BYTE 170,170,170
        BYTE 170,170,170
        BYTE 191,255,254
        BYTE 191,255,254
        BYTE 185,85,102
        BYTE 185,85,102
        BYTE 181,85,86
        BYTE 181,85,86
        BYTE 181,85,86
        BYTE 181,85,86
        BYTE 181,85,86
        BYTE 181,85,86
        BYTE 181,85,86
        BYTE 181,85,86
        BYTE 181,85,86
        BYTE 185,85,102
        BYTE 185,85,102
        BYTE 181,85,86
        BYTE 181,85,86
        BYTE 170,170,170
        BYTE 170,170,170





