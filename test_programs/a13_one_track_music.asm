RASTER  = $9004
S1 	= $900a 			; page 96
S2 	= $900b
S3 	= $900c
S4 	= $900d
VOLUME  = $900e		
	
TIME_H	= $a0
TIME_M	= $a1
TIME_L	= $a2	

SONG_S1 = $fb
SONG_S2 = $fc
SONG_S3 = $fd	
	
WHOL_NOTE = #$08
HALF_NOTE = #$04
QURT_NOTE = #$02
SIXT_NOTE = #$01	
	
	processor	6502
	org		$1001

	dc.w	end
	dc.w	1234
	dc.b	$9e, " 4110", 0
end	dc.w	0

start	lda	#$00
	sta	SONG_S1
	sta	SONG_S2
	sta 	SONG_S3
	
	lda	#$0f
	sta	VOLUME

play	ldx	SONG_S1
	lda	S1NOTES,X	
	sta	S1

	inx
	lda	S1NOTES,X
	beq	next_note
	jmp 	stay_note

next_note	
	inc	SONG_S1
	inc	SONG_S1
	jmp	eighth
stay_note
	dec	S1NOTES,X
	
eighth	pha			; save accumulator
	txa
	pha			; save x
	tya
	pha			; save y
	jsr	eighth_note
	pla
	tay			; restore y
	pla
	tax			; restore x
	pla			; restore accumulator
	
	ldx	SONG_S1
	lda	S1NOTES,X
	cmp	#$ff
	bne	play

	lda	#$00
	sta	S1
	sta	VOLUME
	
	rts

;;; --- SUBROUTINES ---

;;;  wait 1/10th of a second = 10 jiffies
eighth_note
	lda	#$f6		; 5,184,000 jiffies = 24:00:00 = 0x4F1A00
				; 5,183,990 jiffies = 0x4F19F6
	ldx	#$19
	ldy	#$4f
	jsr	$ffd7		; KERNEL: SETTIM
loop16	lda	TIME_H		; check for wrap around
	bne	loop16
	rts			; 10 jiffies elapsed	
	
;;; wait 1 second = 60 jiffies
wait1	lda	#$c4		; 5,184,000 jiffies = 24:00:00 = 0x4F1A00
				; 5,183,940 jiffies = 23:59:58 = 0x4F19C4
	ldx	#$19
	ldy	#$4f
	jsr	$ffd7		; KERNEL: SETTIM
loop	lda	TIME_H		; check for wrap around
	bne	loop
	rts			; 60 jiffies elapsed

;;; --- MUSIC ---
	
	;; first byte is note, second byte is type
S1NOTES dc.b	$e7, WHOL_NOTE		; high E 
	dc.b	$e0, WHOL_NOTE		; step down to C 
	dc.b	$e7, WHOL_NOTE		; high E
	dc.b	$e3, WHOL_NOTE		; step down to D
	dc.b	$e7, WHOL_NOTE		; repeat above
	dc.b	$e0, WHOL_NOTE		
	dc.b	$e7, WHOL_NOTE		
	dc.b	$e3, WHOL_NOTE
	dc.b	$ff, $ff

S3NOTES	dc.b	$ef, $ea, $e7, $e5, $ea, $f0, $ef, $ea
