; draw tiles and choose their attributes
; to draw the map on the screen

; screen resolution is 256x240 pixels
; => 32 x 30 tiles

draw_bg: ; called from main script

; ===========
; PLACE TILES
; ===========
    set_ppu_addr $2000

    ; write to PPU_DATA ($2007)...

    ; TEST: draw zzzz...
    ldx #0
    lda #$23
loop_tile:
    sta PPU_DATA
    inx
    cpx #255
    bne loop_tile

; ===============
; SET ATTRIBUTES
; ===============
    set_ppu_addr $23c0

    ; write to PPU_DATA ($2007)...
    ; (each byte encode the colors for 4 tiles)

    ; set all tiles to palette 0
    ldx #0
    lda #%00000000
loop_attr:
    sta PPU_DATA
    inx
    cpx #(64 - 8)
    bne loop_attr

    rts ; return to main script


; labels can be defined here...
