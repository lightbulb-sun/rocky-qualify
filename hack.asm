SANDBAG_QUALIFY             = 40    ; was 60
SANDBAG_OVERQUALIFY         = 50    ; was 80

PUNCHINGBALL_QUALIFY        = 1     ; was 2
PUNCHINGBALL_OVERQUALIFY_1  = 3     ; was 4
PUNCHINGBALL_OVERQUALIFY_2  = 5     ; was 7

PUNCHINGMITTS_QUALIFY       = 40    ; was 60
PUNCHINGMITTS_OVERQUALIFY   = 50    ; was 80


.computesmschecksum

.memorymap
slotsize $8000
slot 0 $0000
slotsize $4000
slot 1 $8000
defaultslot 1
.endme

.rombankmap
bankstotal 15
banksize $8000
banks 1
banksize $4000
banks 14
.endro

.background "rocky.sms"

.bank 0 slot 0


;;;;;;;;;;;;;;;;;;;; Sandbag ;;;;;;;;;;;;;;;;;;;;
; logic
.orga $3858
        .db     SANDBAG_QUALIFY
.orga $385e
        .db     SANDBAG_OVERQUALIFY
; display
.orga $3790
        .db     SANDBAG_QUALIFY


;;;;;;;;;;;;;;;;; Punching ball ;;;;;;;;;;;;;;;;;
; logic
.orga $3e08
        .db     PUNCHINGBALL_QUALIFY
.orga $3e0e
        .db     PUNCHINGBALL_OVERQUALIFY_1
.orga $3e14
        .db     PUNCHINGBALL_OVERQUALIFY_2
; display
.orga $3d73
        .db     PUNCHINGBALL_QUALIFY


;;;;;;;;;;;;;;;;; Punching mitts ;;;;;;;;;;;;;;;;
; logic
.orga $330f
        .db     PUNCHINGMITTS_QUALIFY
.orga $3315
        .db     PUNCHINGMITTS_OVERQUALIFY
; display
.orga $30ac
        call    display_punchingmitts_qualify_value
.orga $0050
display_punchingmitts_qualify_value:
        ; replace original instruction
        call    $0292

        ld      a, PUNCHINGMITTS_QUALIFY
        ld      de, $7d30
        call    $0521
        ret
