end_screen:
	lda	#00
	sta	VOLUME 
	lda	#$80
	sta	PRINT_MODE

	jsr	prep_splash_screen

	lda	GAME_STATUS
	cmp	#NUM_ZERO
	beq	you_lose

	;; else, you win
	lda     #<win_message	        ; get low byte of message address to print
	sta	MSG_ADDR_LSB
	lda     #>win_message	        ; get high byte of message address to print
	sta	MSG_ADDR_MSB

	jmp	print_win_lose

you_lose:
	lda     #<lose_message	        ; get low byte of message address to print
	sta	MSG_ADDR_LSB
	lda     #>lose_message	        ; get high byte of message address to print
	sta	MSG_ADDR_MSB


print_win_lose:
	jsr	print_message		; common subroutines

	lda	#<level_message
	sta	MSG_ADDR_LSB
	lda	#>level_message
	sta	MSG_ADDR_MSB
	jsr	print_message

	lda	#<score_message
	sta	MSG_ADDR_LSB
	lda	#>lose_message
	sta	MSG_ADDR_MSB
	jsr	print_message

print_level_and_score
	;; print the level
	lda	LEVEL_ADDRESS		; CHANGE THIS
	sta	$1eee

	;; print the score
	lda	#NUM_ZERO
	sta	$1f17
	sta	$1f1a
	lda	SCORE_DIGIT1
	sta	$1f18
	lda	SCORE_DIGIT2
	sta	$1f19

forever:
	jmp	forever

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 DATA                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

win_message:	;; YOU ESCAPED --> 14 bytes
	dc.b	#$1e, #$5d-2			; screen position (minus 2)
	;	Y   O   U
	dc.b	25, 15, 21, 32,			; 32 = space
	;       E   S   C  A  P   E  D  ! (with high bit set)
	dc.b	5,  19, 3, 1, 16, 5, 4, 33+#$80
	

lose_message:	;; YOU LOSE --> 10 bytes
	dc.b	#$1e, #$5f-2			; screen position (minus 2)
	;	Y   O   U
	dc.b	25, 15, 21, 32 			; 32 = space
	;       L   O	S   E (with high bit set)
	dc.b	12, 15, 19, 5+#$80

level_message: 
	dc.b	#$1e, #$de-2
	;	L   E  V   E  L (with high bit set)
	dc.b	12, 5, 22, 5, 12+#$80

score_message: 
	dc.b	#$1f, #$0a-2
	;	S   C  O   R   E (with high bit set)
	dc.b	19, 3, 15, 18, 5+#$80

