
;;; ---- ZERO PAGE
SCRN_LSB        = $00           ; LSB of screen memory address
SCRN_MSB        = $01           ; MSB Of screen memory address
CLRM_LSB        = $04           ; LSB of colour memory address
CLRM_MSB        = $05           ; MSB Of colour memory address

GAME_STATUS     = $07           ; if this is not 0, end game

CURR_SPRITE     = $08           ; stores the starting character for current sprite
FRAME           = $09           ; frame counter for delays
CURR_CLR        = $0a           ; stores the current character colour
TIMER_CTR       = $0b           ; timer counter
NUM_WRAPS       = $0c           ; used to figure out end game condition
        ; basically, counts the number of times the numbers wrap per decrement
        ; If this reaches 3, then FULL WRAP AROUND so end game
SPRITE_X        = $0d
SPRITE_Y        = $0e
SPRITE_PREV_X   = $0f
SPRITE_PREV_Y   = $10


;; save the previous position of sprite incase invalid movement
PREV_SPRITE_LSB = $11
PREV_SPRITE_MSB = $12
PREV_SPRITE_CLR_LSB = $15
PREV_SPRITE_CLR_MSB = $16

;; current / proposed movement of sprite
SPRITE_LSB      = $18
SPRITE_MSB      = $19
SPRITE_CLR_LSB  = $1a
SPRITE_CLR_MSB  = $1b

LETTER_LSB      = $1e
LETTER_MSB      = $1f
LETTER_CLR_LSB  = $20
LETTER_CLR_MSB  = $21

SCORE_LSB       = $22
SCORE_MSB       = $23

LFSR            = $24

OFFSET          = $25
LSB             = $26
MSB             = $27

MAZE_X_COORD    = $28
MAZE_Y_COORD    = $29
MAZE_LSB        = $2a
MAZE_MSB        = $2b
MAZE_DIR        = $2c

TREE_CLR_LSB    = $2d
TREE_CLR_MSB    = $2e
TREE_LSB        = $2f
TREE_MSB        = $30

S1_INDEX        = $31
S1_DUR          = $32
S3_INDEX        = $33
S3_DUR          = $34
MOD_FLAG        = $35

ANIMATE_COUNT   = $36
ANIMATE_STATUS  = $37

ROOM_SEED       = $38
CURR_ROOM       = $39
LETTER_STATE    = $3a

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            SPLASH SCREENS              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SP_SCREEN_LSB	= $00
SP_SCREEN_MSB 	= $01
CHAR_NUM_CTR    = $03
GLITCH_CTR	= $04
MAZE_SEED	= $05

;; SKIP $07 FOR END GAME CONDITION

MSG_ADDR_LSB    = $08
MSG_ADDR_MSB	= $09
SCRN_OFFSET_LSB = $0a
SCRN_OFFSET_MSB = $0b

SCORE_DIGIT1	= $0c
SCORE_DIGIT2	= $0d

PRINT_MODE	= $0e

