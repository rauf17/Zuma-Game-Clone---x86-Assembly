;ABDUL RAUF
;23I-0591
;BSCS-C


include Irvine32.inc
include macros.inc

BUFFER=5000

.data

   ; SCORE byte 0
    save_name byte 50 DUP(?)
    array byte BUFFER DUP(?)
    result byte BUFFER DUP(?)
    HANDLER handle ?
    count dword 0
    file byte "SCORE.txt", 0

ZUMBA_ART db '       ________  ___  ___  _____ ______   ________  ________           ',13,10        
          db '                |\_____  \|\  \|\  \|\   _ \  _   \|\   __  \|\   __  \         ',13,10 
          db '                 \|___/  /\ \  \\\  \ \  \\\__\ \  \ \  \|\ /\ \  \|\  \        ',13,10 
          db '                     /  / /\ \  \\\  \ \  \\|__| \  \ \   __  \ \   __  \       ',13,10  
          db '                    /  /_/__\ \  \\\  \ \  \    \ \  \ \  \|\  \ \  \ \  \      ',13,10 
          db '                   |\________\ \_______\ \__\    \ \__\ \_______\ \__\ \__\     ',13,10 
          db '                    \|_______|\|_______|\|__|     \|__|\|_______|\|__|\|__|     ',13,10 
          db 0                            
                                                                                                        
                                
WELCOME_ART db '    ___       __   _______   ___       ________  ________  _____ ______   _______         ' , 13,10    
            db '             |\  \     |\  \|\  ___ \ |\  \     |\   ____\|\   __  \|\   _ \  _   \|\  ___ \        ' , 13,10 
            db '             \ \  \    \ \  \ \   __/|\ \  \    \ \  \___|\ \  \|\  \ \  \\\__\ \  \ \   __/|       ' , 13,10 
            db '              \ \  \  __\ \  \ \  \_|/_\ \  \    \ \  \    \ \  \\\  \ \  \\|__| \  \ \  \_|/__     ' , 13,10 
            db '               \ \  \|\__\_\  \ \  \_|\ \ \  \____\ \  \____\ \  \\\  \ \  \    \ \  \ \  \_|\ \    ' , 13,10  
            db '                \ \____________\ \_______\ \_______\ \_______\ \_______\ \__\    \ \__\ \_______\   ' , 13,10 
            db '                 \|____________|\|_______|\|_______|\|_______|\|_______|\|__|     \|__|\|_______|   ' , 13,10 
            db 0                                                                
                                                                                    
                                                                             

                                                                      
START             DB '                                  _____ __             __    ',13,10
                  DB '                                 / ___// /_____ ______/ /_   ',13,10
                  DB '                                 \__ \/ __/ __ `/ ___/ __/   ',13,10
                  DB '                                 ___/ / /_/ /_/ / /  / /_     ',13,10
                  DB '                                /____/\__/\__,_/_/   \__/     ',13,10
                  DB 0   

INSTRUCTIONS    DB '                    ____           __                  __  _                 ',13,10
                DB '                   /  _/___  _____/ /________  _______/ /_(_)___  ____  _____',13,10
                DB '                   / // __ \/ ___/ __/ ___/ / / / ___/ __/ / __ \/ __ \/ ___/',13,10
                DB '                 _/ // / / (__  ) /_/ /  / /_/ / /__/ /_/ / /_/ / / / (__  ) ',13,10
                DB '                /___/_/ /_/____/\__/_/   \__,_/\___/\__/_/\____/_/ /_/____/  ',13,10
                DB 0
            
EXITED           DB '                                  ______     _ __  ',13,10
                 DB '                                 / ____/  __(_) /_',13,10
                 DB '                                / __/ | |/_/ / __/',13,10
                 DB '                               / /____>  </ / /_  ',13,10
                 DB '                               ____/_/_/|_/_/\__/ ',13,10
                 DB 0

POINTER            DB'  *<<<<<<<<*=*>>>>>>>>>*   ',13,10
                    DB 0

pauseScreen         db'                        ______                        ____                            __              ',13,10
                    db'                       / ____/___ _____ ___  ___     / __ \____ ___  __________  ____/ /              ',13,10
                    db'                      / / __/ __ `/ __ `__ \/ _ \   / /_/ / __ `/ / / / ___/ _ \/ __  /               ',13,10
                    db'                     / /_/ / /_/ / / / / / /  __/  / ____/ /_/ / /_/ (__  )  __/ /_/ /                ',13,10
                    db'                     \____/\__,_/_/ /_/ /_/\___/  /_/    \__,_/\__,_/____/\___/\__,_/                 ',13,10
                    db'                                                                                                      ',13,10
                    db'                                                                                                      ',13,10
                    db 0

GameEndScreen      db'                                                                                                       ',13,10
                   db'                        ______                        ______          __                               ',13,10
                   db'                       / ____/___ _____ ___  ___     / ____/___  ____/ /                               ',13,10
                   db'                      / / __/ __ `/ __ `__ \/ _ \   / __/ / __ \/ __  /                                ',13,10
                   db'                     / /_/ / /_/ / / / / / /  __/  / /___/ / / / /_/ /                                 ',13,10
                   db'                     \____/\__,_/_/ /_/ /_/\___/  /_____/_/ /_/\__,_/                                  ',13,10
                                                      
                   db 0
INSTRUCTIONS_SCREEN             db'     +=======================================================================+',13,10
                                db '                        ||                          | INSTRUCTIONS |                             || ',13,10
                                db '                        ||                          ================                             || ',13,10
                                db '                        ||                                                                       || ',13,10
                                db '                        ||  1 - Press the (q w e a s d z x c) to rotate ZUMBA in all directions. || ',13,10
                                db '                        ||  2 - Press the space key to shoot.                                    || ',13,10
                                db '                        ||  3 - Press Escape Key to Pause the Game                               || ',13,10
                                db '                         +=======================================================================+  ',13,10
                                db 0
 
gameOverScreen    db'                     ______                        ____                                                ',13,10
                  db'                    / ____/___ _____ ___  ___     / __ \_   _____  _____                               ',13,10
                  db'                   / / __/ __ `/ __ `__ \/ _ \   / / / / | / / _ \/ ___/                               ',13,10
                  db'                  / /_/ / /_/ / / / / / /  __/  / /_/ /| |/ /  __/ /                                   ',13,10
                  db'                  \____/\__,_/_/ /_/ /_/\___/   \____/ |___/\___/_/                                    ',13,10
                  db 0

LevelsScreen db'                                                                                                            ',13,10
             db'                                      ___           ___           ___           ___                         ',13,10 
             db'                                     /\__\         /\  \         /\__\         /\__\                        ',13,10   
             db'                                    /::|  |       /::\  \       /::|  |       /:/  /                        ',13,10  
             db'                                   /:|:|  |      /:/\:\  \     /:|:|  |      /:/  /                         ',13,10 
             db'                                  /:/|:|__|__   /::\~\:\  \   /:/|:|  |__   /:/  /  ___                     ',13,10 
             db'                                 /:/ |::::\__\ /:/\:\ \:\__\ /:/ |:| /\__\ /:/__/  /\__\                    ',13,10 
             db'                                 \/__/~~/:/  / \:\~\:\ \/__/ \/__|:|/:/  / \:\  \ /:/  /                    ',13,10 
             db'                                       /:/  /   \:\ \:\__\       |:/:/  /   \:\  /:/  /                     ',13,10 
             db'                                      /:/  /     \:\ \/__/       |::/  /     \:\/:/  /                      ',13,10 
             db'                                     /:/  /       \:\__\         /:/  /       \::/  /                       ',13,10 
             db'                                     \/__/         \/__/         \/__/         \/__/                        ',13,10 
             db'                                                                                                            ',13,10
             db'                              ______________________________________________________________                ',13,10
             db'                     ******(@)   SELECT YOUR DESIRED OPTION BY PRESSING THE ALLOCATED KEY  (@)******        ',13,10
             db'                              --------------------------------------------------------------                ',13,10
             db'                              .____________________________________________________________.                ',13,10
             db'                              |   .______________.   .______________.   .______________.   |                ',13,10
             db'                              |   || 1. Level 1 ||   || 2. Level 2 ||   || 3. Level 3 ||   |                ',13,10
             db'                              |   *--------------*   *--------------*   *--------------*   |                ',13,10
             db'                              |   .______________.   .______________.   .______________.   |                ',13,10
             db'                              |   || 4.Level 4  ||   || 5. Level 5 ||   || 6. Exit    ||   |                ',13,10
             db'                              |   *--------------*   *--------------*   *--------------*   |                ',13,10
             db'                              |   .______________.   .______________.   .______________.   |                ',13,10
             db'                              |   ||     X      ||   || 7. Scores  ||   ||      X     ||   |                ',13,10
             db'                              |   *--------------*   *--------------*   *--------------*   |                ',13,10
             db'                              *------------------------------------------------------------*                ',13,10
             db'                                                                                                            ',13,10
             db 0


menuSelect db 1
gameState db 1          ;1 = running, 0 = stopped

prompt1 db '                                ',13,10
        db '                                           ___________________________',13,10
        db '                                           ---------------------------',13,10
        db '                                           |||   Enter your name   |||',13,10
        db '                                           ___________________________',13,10
        db '                                           ---------------------------',13,10
        db '                                                                      ',13,10
        db 0

names db 20 dup (32)
strName db "Name:",0

current_wall db ?
upperwall db 10
lowerwall db 23
rightwall db 93
leftwall db 23

upperwall1 db 12
lowerwall1 db 20
rightwall1 db 85
leftwall1 db 58

upperwall3 db 8
lowerwall3 db 26
rightwall3 db 94
leftwall3 db 21

    ;--------------------
    ;   BALLS ARE HERE
    ;--------------------

    GH4_L2_x db  25
    GH4_L2_y db  7
    mov_G4L2 db 'r'

    GH4_L1_x db  25
    GH4_L1_y db  10
    mov_G4L1 db 'r'

    BallsofLevel1 db 101 dup ('o')
    BallsofLevel2 db 202 dup ('@')
    BallsofLevel3 db 303 dup ('O')

    OTP byte 1
    OTP_2 byte 1

    ; Level layout
    walls BYTE "=============================================================================== ", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                    | |                                      |", 0
          BYTE "|                                    | |                                      |", 0
          BYTE "|                                   /___\                                     |", 0
          BYTE "|                                  |     |                                    |", 0
          BYTE "|                                  |     |                                    |", 0
          BYTE "|                                  | === |                                    |", 0
          BYTE "|                                   \___/                                     |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "=============================================================================== ", 0
          BYTE 0

 walls2   BYTE "=============================================================================== ", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                     _                                       |", 0
          BYTE "|                                    |:|                                      |", 0
          BYTE "|                                    | |                                      |", 0
          BYTE "|                                   /___\                                     |", 0
          BYTE "|                                  |     |                                    |", 0
          BYTE "|                                  |     |                                    |", 0
          BYTE "|                                  | === |                                    |", 0
          BYTE "|                                   \-_-/                                     |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "=============================================================================== ", 0
          BYTE 0

 walls3   BYTE "=============================================================================== ", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                     _                                       |", 0
          BYTE "|                                    |:|                                      |", 0
          BYTE "|                                    |:|                                      |", 0
          BYTE "|                                 / /+-+\ \                                   |", 0
          BYTE "|                                 \|     |/                                   |", 0
          BYTE "|                                  |     |                                    |", 0
          BYTE "|                                 /| === |\                                   |", 0
          BYTE "|                                 | \*_*/ |                                   |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "|                                                                             |", 0
          BYTE "=============================================================================== ", 0
          BYTE 0

          Ballcave BYTE '                     ',13,10
BYTE '                   |  /////   ',13,10
BYTE '                   | X=',13,10
BYTE '                   |  \\\\\   ',13,10
db 0

          Ballcave2 BYTE '===============',13,10
BYTE '                   |   =====  ',13,10
BYTE '                   |  /////   ',13,10
BYTE '                   | X=>',13,10
BYTE '                   |  \\\\\   ',13,10
BYTE '                   |   =====  ',13,10
db 0

          Ballcave3 BYTE '===============',13,10
BYTE '                   |   =====>>> ',13,10
BYTE '                   |  /////     ',13,10
BYTE '                   | X=>>>>>>>> ',13,10
BYTE '                   |  \\\\\     ',13,10
BYTE '                   |   =====>>> ',13,10
db 0


    ; Player sprite
    player_right BYTE "   ", 0
                 BYTE " @-", 0
                 BYTE "   ", 0

    player_left BYTE "   ", 0
                BYTE "-@ ", 0
                BYTE "   ", 0

    player_up BYTE " | ", 0
              BYTE " @ ", 0
              BYTE "   ", 0

    player_down BYTE "   ", 0
                BYTE " @ ", 0
                BYTE " | ", 0

    player_upright BYTE "  /", 0
                   BYTE " @ ", 0
                   BYTE "   ", 0

    player_upleft BYTE "\  ", 0
                  BYTE " @ ", 0
                  BYTE "   ", 0

    player_downright BYTE "   ", 0
                     BYTE " @ ", 0
                     BYTE "  \", 0

    player_downleft BYTE "   ", 0
                    BYTE " @ ", 0
                    BYTE "/  ", 0

    ; Player's starting position (center)
    xPos db 56      ; Column (X)
    yPos db 15      ; Row (Y)

    xDir db 0
    yDir db 0

    ; Default character (initial direction)
    inputChar db 0
    direction db "d"

    current_color db 4   ; Default player color (red)

    ; Fire symbol properties (fired from player)
    fire_symbol db "*", 0
    fire_row db 0        ; Fire will be fired from the player's position
    fire_col db 0        ; Initial fire column will be set in the update logic

    ; Interface variables
    score db 0          ; Player's score
    lives db 1          ; Player's lives
    levelInfo db 1
    
    ; Counter variables for loops
    counter1 db 0
    counter2 db 0

    ; Colors for random asterisks
color_white db 15   ; White
color_blue db 1     ; Blue
color_cyan db 11    ; Cyan
color_magenta db 13 ; Magenta
color_pink db 13    ; Pink (also magenta)
color_orange db 6   ; Orange
color_gray db 8     ; Gray

row_colour db ?
col_colour db ?

tunnel_enter_x db 50
tunnel_enter_y db 11
tunnel_exit_x db 65

.code

Level3RandomColoredFire PROC
    ; Generate a random number and map it to one of the predefined colors
    mov eax, 7           ; Set the range (0 to 6) for random numbers
    call RandomRange     ; Generates a random number in EAX

    cmp eax, 0
    je set_white
    cmp eax, 1
    je set_blue
    cmp eax, 2
    je set_cyan
    cmp eax, 3
    je set_magenta
    cmp eax, 4
    je set_pink
    cmp eax, 5
    je set_orange
    cmp eax, 6
    je set_gray

set_white:
    mov al, color_white
    mwrite "    White"
    mwrite "             "

    ret

set_blue:
    mov al, color_blue
    mwrite "    Blue"
    mwrite "             "
    ret

set_cyan:
    mov al, color_cyan
    mwrite "    Cyan"
     mwrite "             "
    ret

set_magenta:
    mov al, color_magenta
    mwrite "    Magenta"
    mwrite "             "
    ret

set_pink:
    mov al, color_pink
    mwrite "    Pink"
    mwrite "             "
    ret

set_orange:
    mov al, color_orange
    mwrite "    Orange"
    mwrite "             "
    ret

set_gray:
    mov al, color_gray
    mwrite "    Gray"
    mwrite "             "
    ret
Level3RandomColoredFire ENDP

LevelRandomColor3 PROC

    ; Generate a random number and map it to one of the predefined colors
    mov eax, 7           ; Set the range (0 to 6) for random numbers
    call RandomRange     ; Generates a random number in EAX

    cmp eax, 0
    je set_white
    cmp eax, 1
    je set_blue
    cmp eax, 2
    je set_cyan
    cmp eax, 3
    je set_magenta
    cmp eax, 4
    je set_orange
    cmp eax, 5
    je set_gray
    cmp eax, 6
    je set_pink

set_white:
    mov al, color_white
    ret

set_blue:
    mov al, color_blue
    ret

set_cyan:
    mov al, color_cyan
    ret

set_magenta:
    mov al, color_magenta
    ret

set_orange:
    mov al, color_orange
    ret
set_gray:
    mov al, color_gray
    ret
set_pink:
    mov al, color_pink
    ret
LevelRandomColor3 ENDP


Level2RandomColoredFire PROC
     ; Generate a random number and map it to one of the predefined colors
    mov eax, 5           ; Set the range (0 to 2) for random numbers
    call RandomRange     ; Generates a random number in EAX

    cmp eax, 0
    je set_white
    cmp eax, 1
    je set_blue
    cmp eax, 2
    je set_cyan
    cmp eax, 3
    je set_magenta
    cmp eax, 4
    je set_orange

set_white:
    mov al, color_white
    mwrite "    White"
    mwrite "             "
    ret

set_blue:
    mov al, color_blue
    mwrite "    Blue"
    mwrite "             "
    ret

set_cyan:
    mov al, color_cyan
    mwrite "    Cyan"
     mwrite "             "
    ret

set_magenta:
    mov al, color_magenta
    mwrite "    Magenta"
    mwrite "             "
    ret

set_orange:
    mov al, color_orange
    mwrite "    Orange"
    mwrite "             "
    ret

Level2RandomColoredFire ENDP

LevelRandomColor2 PROC

    ; Generate a random number and map it to one of the predefined colors
    mov eax, 5           ; Set the range (0 to 6) for random numbers
    call RandomRange     ; Generates a random number in EAX

    cmp eax, 0
    je set_white
    cmp eax, 1
    je set_blue
    cmp eax, 2
    je set_cyan
    cmp eax, 3
    je set_magenta
    cmp eax, 4
    je set_orange


set_white:
    mov al, color_white
    ret

set_blue:
    mov al, color_blue
    ret

set_cyan:
    mov al, color_cyan
    ret

set_magenta:
    mov al, color_magenta
    ret

set_orange:
    mov al, color_orange
    ret

LevelRandomColor2 ENDP


Level1RandomColoredFire PROC
     ; Generate a random number and map it to one of the predefined colors
    mov eax, 3           ; Set the range (0 to 2) for random numbers
    call RandomRange     ; Generates a random number in EAX

    cmp eax, 0
    je set_blue
    cmp eax, 1
    je set_cyan
    cmp eax, 2
    je set_magenta

set_blue:
    mov al, color_blue
    mwrite "    Blue"
    mwrite "             "
    ret

set_cyan:
    mov al, color_cyan
    mwrite "    Cyan"
     mwrite "             "
    ret

set_magenta:
    mov al, color_magenta
    mwrite "    Magenta"
    mwrite "             "
    ret
Level1RandomColoredFire ENDP

LevelRandomColor1 PROC

    ; Generate a random number and map it to one of the predefined colors
    mov eax, 3           ; Set the range (0 to 6) for random numbers
    call RandomRange     ; Generates a random number in EAX

    cmp eax, 0
    je set_blue
    cmp eax, 1
    je set_cyan
    cmp eax, 2
    je set_magenta

set_blue:
    mov al, color_blue
    ret

set_cyan:
    mov al, color_cyan
    ret

set_magenta:
    mov al, color_magenta
    ret

LevelRandomColor1 ENDP


FireBallL1 PROC
    ; Fire a projectile from the player's current face direction
    mov dl, xPos      ; Fire column starts at the player's X position
    mov dh, yPos      ; Fire row starts at the player's Y position


    mov fire_col, dl  ; Save the fire column position
    mov fire_row, dh  ; Save the fire row position

    ; Determine direction
    mov al, direction
    cmp al, "w"
    je fire_up

    cmp al, "x"
    je fire_down

    cmp al, "a"
    je fire_left

    cmp al, "d"
    je fire_right

    cmp al, "q"
    je fire_upleft

    cmp al, "e"
    je fire_upright

    cmp al, "z"
    je fire_downleft

    cmp al, "c"
    je fire_downright

    jmp end_fire

fire_up:
    mov fire_row, 10
    mov fire_col, 57
    mov xDir, 0
    mov yDir, -1
    jmp fire_loop

fire_down:
    mov fire_row, 20
    mov fire_col, 57
    mov xDir, 0
    mov yDir, 1
    jmp fire_loop

fire_left:
    mov fire_col, 48
    mov fire_row, 16
    mov xDir, -2
    mov yDir, 0
    jmp fire_loop

fire_right:
    mov fire_col, 61
    mov fire_row, 16
    mov xDir, 2
    mov yDir, 0
    jmp fire_loop

fire_upleft:
    mov fire_row, 14
    mov fire_col, 51
    mov xDir, -1
    mov yDir, -1
    jmp fire_loop

fire_upright:
    mov fire_row, 14
    mov fire_col, 61
    mov xDir, 1
    mov yDir, -1
    jmp fire_loop

fire_downleft:
    mov fire_row, 20
    mov fire_col, 54
    mov xDir, -1
    mov yDir, 1
    jmp fire_loop

fire_downright:
    mov fire_row, 20
    mov fire_col, 61
    mov xDir, 1
    mov yDir, 1
    jmp fire_loop

fire_loop:
    add score,2
    mov dl,19
    mov dh,2
    call Gotoxy
    mWrite <"Score: ">
    mov eax, Blue + (black * 16)
    call SetTextColor
    mov al, score
    call WriteDec

    ; Initialise fire position
    mov dl, fire_col
    mov dh, fire_row
    call GoToXY

    ; Generate and set random color
    mov row_colour, dh
    mov col_colour, dl

    mov dl,65
    mov dh,2
    call GOTOXY
    call Level1RandomColoredFire

    mov dl, col_colour
    mov dh, row_colour
    call GOTOXY

    movzx eax, al        ; Get random color
    call SetTextColor

L1:
    ; Check fireball boundaries before moving
    cmp dl, 20            ; Left wall boundary
    jle end_fire

    cmp dl, 96            ; Right wall boundary
    jge end_fire

    cmp dh, 4             ; Upper wall boundary
    jle end_fire

    cmp dh, 27            ; Lower wall boundary
    jge end_fire

    ; Print fireball symbol and continue movement
    call GoToXY
    mWrite "*"

    ; Delay for smooth movement
    mov eax, 50
    call Delay

    ; Clear previous fireball position before moving again
    call GoToXY
    mWrite " "
    add dl, xDir
    add dh, yDir
    jmp L1

end_fire:
    ret
FireBallL1 ENDP

DrawWall1 PROC
    ; Draw level layout
    call clrscr
    ; Display Score, Lives, Level info

     ;NAME INPUT
    mov eax,White
    call SetTextColor
    mov dh,2
    mov dl,3
    call gotoxy
    mwrite "Name : "
    call crlf
    mwrite "    "
    mov eax,Cyan
    call SetTextColor
    mov edx,offset names
    mov ecx,lengthof names
    call WriteString

    mov eax,White
    call SetTextColor

    mov dl,19
    mov dh,2
    call Gotoxy
    mWrite <"Score: ">
    mov eax, Blue + (black * 16)
    call SetTextColor
    mov al, score
    call WriteDec

    mov eax, White + (black * 16)
    call SetTextColor
    mov dl,90
    mov dh,2
    call Gotoxy
    mWrite <"Lives: ">
    mov eax, Red + (black * 16)
    call SetTextColor
    mov al, lives
    call WriteDec

    mov levelInfo, 1

    mov eax, white + (black * 16)
    call SetTextColor
    mov dl,55
    mov dh,2
    call Gotoxy
    mWrite "LEVEL " 
    mov al, levelInfo
    call WriteDec

    mov eax, Red
    call SetTextColor
    mov dl, 19
    mov dh, 4
    call Gotoxy

    mov esi, offset walls
    mov counter1, 50
    mov counter2, 80
    movzx ecx, counter1
    printcolumn:
        mov counter1, cl
        movzx ecx, counter2
        printrow:
            mov eax, [esi]
            call WriteChar
            inc esi
        loop printrow
        
        dec counter1
        movzx ecx, counter1
        mov dl, 19
        inc dh
        call Gotoxy
    loop printcolumn

    ret
DrawWall1 ENDP


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;      LEVEL # 01     ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PrintPlayer PROC
    ; Set text color for the player
    mov eax, brown + (black * 16)
    call SetTextColor

    ; Get the current direction and print the corresponding player sprite
    mov al, direction
    cmp al, "w"
    je print_up

    cmp al, "x"
    je print_down

    cmp al, "a"
    je print_left

    cmp al, "d"
    je print_right

    cmp al, "q"
    je print_upleft

    cmp al, "e"
    je print_upright

    cmp al, "z"
    je print_downleft

    cmp al, "c"
    je print_downright

    ret

print_up:
    mov esi, offset player_up
    jmp print

print_down:
    mov esi, offset player_down
    jmp print

print_left:
    mov esi, offset player_left
    jmp print

print_right:
    mov esi, offset player_right
    jmp print

print_upleft:
    mov esi, offset player_upleft
    jmp print

print_upright:
    mov esi, offset player_upright
    jmp print

print_downleft:
    mov esi, offset player_downleft
    jmp print

print_downright:
    mov esi, offset player_downright
    jmp print

print:
    ; Clear the previous player position
    mov dl, xPos
    mov dh, yPos
    call GoToXY
    mWrite "   "    ; Clearing the previous position

    ; Print the new player sprite
    mov dl, xPos
    mov dh, yPos
    call GoToXY

    mov counter1, 3
    mov counter2, 4
    movzx ecx, counter1
    print_column:
        mov counter1, cl
        movzx ecx, counter2
        print_row:
            mov eax, [esi]
            call WriteChar
            inc esi
        loop print_row

        movzx ecx, counter1
        mov dl, xPos
        inc dh
        call Gotoxy
    loop print_column

    ret
PrintPlayer ENDP

MovePlayer1 PROC
    mov dx, 0
    call GoToXY

checkInput:
    mov eax, 5
    call Delay

    ; Check for key press
    mov eax, 0
    call ReadKey
    mov inputChar, al

    cmp inputChar, VK_SPACE
    je shoot

    cmp inputChar, VK_ESCAPE
    je paused

    cmp inputChar, "w"
    je move

    cmp inputChar, "a"
    je move

    cmp inputChar, "x"
    je move

    cmp inputChar, "d"
    je move

    cmp inputChar, "q"
    je move

    cmp inputChar, "e"
    je move

    cmp inputChar, "z"
    je move
    
    cmp inputChar, "c"
    je move

    jmp chosen

move:
    mov al, inputChar
    mov direction, al
    jmp checkInput

paused:
    call Readkey
    mov inputchar, al
    cmp inputchar, 'p'
    je chosen
    jne paused
    ret

shoot:
    call FireBallL1
    jmp checkInput

chosen:
 ; Update and draw ball inside MovePlayer
 call PrintPlayer
 ;call PRINT_G4_L2
 call MOV_G4_L1
 ;call COLIDE_G4_L1
 jmp checkInput
  
ret
MovePlayer1 ENDP

;upperwall1 = 12
;lowerwall1 = 20
;rightwall1 = 85
;leftwall1 = 25

;GH4_L1_x = 25
;GH4_L1_y = 10

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MOV_G4_L1 PROC
    mov eax,RED
    call settextcolor

    mov dl, 22
    mov dh, 8
    call GOTOXY
    mov edx, offset BallCave
    call writestring
    mov edx,0
    mov eax,0

    mov esi, 1
    mov ecx, 101

  ; Erase the old position
    mov dl, GH4_L1_x
    mov dh, GH4_L1_y

    ; Generate a random color for the ball
    call LevelRandomColor1
    mov current_color, al  ; Store the generated color

    ; Apply the random color
    movzx eax, current_color
    call SetTextColor

    call GoToXY

    mov al, BallsofLevel1[esi]
    call writechar
    inc esi

    ; Determine movement based on the current wall
    mov al, current_wall

    cmp al, 1 ; Upper wall
    je move_upper

    cmp al, 2 ; Right wall
    je move_right_wall

    cmp al, 3 ; Lower wall
    je move_lower

    cmp al, 4 ; Left wall
    je move_left_wall

    move_upper:
        ; Move right on the upper wall
        mov eax, 40                 
        call delay
        inc GH4_L1_x
        mov al,rightwall1
        cmp GH4_L1_x, al
        jle done ; If not at the end, continue
        ; Transition to the right wall
        mov current_wall, 2
        inc GH4_L1_y ; Move to the first cell of the right wall
        jmp done

    move_right_wall:
        ; Move down on the right wall
        mov eax, 80                 ;80
        call delay
        inc GH4_L1_y
        mov al, lowerwall1
        cmp GH4_L1_y, al
        jle done ; If not at the end, continue
        ; Transition to the lower wall
        mov current_wall, 3
        dec GH4_L1_x ; Move to the first cell of the lower wall
        dec lowerwall1
        jmp done

    move_lower:
        ; Move left on the lower wall
        mov eax, 40                 ;40
        call delay
        dec GH4_L1_x
        mov al, leftwall1
        cmp GH4_L1_x, al
        jge done ; If not at the end, continue
        ; Transition to the left wall
        mov current_wall, 4
        dec GH4_L1_y ; Move to the first cell of the left wall
        inc leftwall1
        jmp done

    move_left_wall:
        ; Move up on the left wall
        mov eax, 80          ;80
        call delay
        dec GH4_L1_y
        mov al, upperwall1
        cmp GH4_L1_y, al
        jge done ; If not at the end, continue
        ; Transition to the second line of the upper wall
        mov current_wall, 1
        inc GH4_L1_y ; Move to the second line
        inc upperwall1
        jmp done

    done:
        ; Draw the new position
        mov dl, GH4_L1_x
        mov dh, GH4_L1_y
        call GoToXY
        
        mov al, BallsofLevel1[esi]
        call writechar 

        cmp GH4_L1_x, 57
        je REACHEDTURRET

        jmp exit_this_loop
REACHEDTURRET:
    cmp GH4_L1_y,18
    je REACHEDTURRET2

 cmp esi,ecx
 jl exit_this_loop

REACHEDTURRET2:
    mov gameState, 0
    call GameOver
exit_this_loop:
    
      ret
MOV_G4_L1 ENDP

;-------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-------------------------------------------------------------;
;-------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-------------------------------------------------------------;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;      LEVEL # 02     ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DrawWall2 PROC
    ; Draw level layout
    call clrscr
    ; Display Score, Lives, Level info

     ;NAME INPUT
    mov eax,White
    call SetTextColor
    mov dh,2
    mov dl,3
    call gotoxy
    mwrite "Name : "
    call crlf
    mwrite "    "
    mov eax,Cyan
    call SetTextColor
    mov edx,offset names
    mov ecx,lengthof names
    call WriteString

    mov eax,White
    call SetTextColor

    mov dl,19
    mov dh,2
    call Gotoxy
    mWrite <"Score: ">
    mov eax, Blue + (black * 16)
    call SetTextColor
    mov al, score
    call WriteDec

    mov eax, White + (black * 16)
    call SetTextColor
    mov dl,90
    mov dh,2
    call Gotoxy
    mWrite <"Lives: ">
    mov eax, Red + (black * 16)
    call SetTextColor
    mov al, lives
    call WriteDec

    mov eax, white + (black * 16)
    call SetTextColor
    mov dl,55
    mov dh,2
    call Gotoxy
    mov levelInfo,2
    mWrite "LEVEL " 
    mov al, levelInfo
    call WriteDec

    mov eax, Red
    call SetTextColor
    mov dl, 19
    mov dh, 4
    call Gotoxy

    mov esi, offset walls2
    mov counter1, 50
    mov counter2, 80
    movzx ecx, counter1
    printcolumn:
        mov counter1, cl
        movzx ecx, counter2
        printrow:
            mov eax, [esi]
            call WriteChar
            inc esi
        loop printrow
        
        dec counter1
        movzx ecx, counter1
        mov dl, 19
        inc dh
        call Gotoxy
    loop printcolumn

    ret
DrawWall2 ENDP

FireBallL2 PROC
    ; Fire a projectile from the player's current face direction
    mov dl, xPos      ; Fire column starts at the player's X position
    mov dh, yPos      ; Fire row starts at the player's Y position


    mov fire_col, dl  ; Save the fire column position
    mov fire_row, dh  ; Save the fire row position

    ; Determine direction
    mov al, direction
    cmp al, "w"
    je fire_up

    cmp al, "x"
    je fire_down

    cmp al, "a"
    je fire_left

    cmp al, "d"
    je fire_right

    cmp al, "q"
    je fire_upleft

    cmp al, "e"
    je fire_upright

    cmp al, "z"
    je fire_downleft

    cmp al, "c"
    je fire_downright

    jmp end_fire

fire_up:
    mov fire_row, 10
    mov fire_col, 57
    mov xDir, 0
    mov yDir, -1
    jmp fire_loop

fire_down:
    mov fire_row, 20
    mov fire_col, 57
    mov xDir, 0
    mov yDir, 1
    jmp fire_loop

fire_left:
    mov fire_col, 48
    mov fire_row, 16
    mov xDir, -2
    mov yDir, 0
    jmp fire_loop

fire_right:
    mov fire_col, 61
    mov fire_row, 16
    mov xDir, 2
    mov yDir, 0
    jmp fire_loop

fire_upleft:
    mov fire_row, 14
    mov fire_col, 51
    mov xDir, -1
    mov yDir, -1
    jmp fire_loop

fire_upright:
    mov fire_row, 14
    mov fire_col, 61
    mov xDir, 1
    mov yDir, -1
    jmp fire_loop

fire_downleft:
    mov fire_row, 20
    mov fire_col, 54
    mov xDir, -1
    mov yDir, 1
    jmp fire_loop

fire_downright:
    mov fire_row, 20
    mov fire_col, 61
    mov xDir, 1
    mov yDir, 1
    jmp fire_loop

fire_loop:
    add score,2
    mov dl,19
    mov dh,2
    call Gotoxy
    mWrite <"Score: ">
    mov eax, Blue + (black * 16)
    call SetTextColor
    mov al, score
    call WriteDec

    ; Initialise fire position
    mov dl, fire_col
    mov dh, fire_row
    call GoToXY

    ; Generate and set random color
    mov row_colour, dh
    mov col_colour, dl

    mov dl,65
    mov dh,2
    call GOTOXY
    call Level2RandomColoredFire

    mov dl, col_colour
    mov dh, row_colour
    call GOTOXY

    movzx eax, al        ; Get random color
    call SetTextColor

L1:
    ; Check fireball boundaries before moving
    cmp dl, 20            ; Left wall boundary
    jle end_fire

    cmp dl, 96            ; Right wall boundary
    jge end_fire

    cmp dh, 4             ; Upper wall boundary
    jle end_fire

    cmp dh, 27            ; Lower wall boundary
    jge end_fire

    ; Print fireball symbol and continue movement
    call GoToXY
    mWrite "*"

    ; Delay for smooth movement
    mov eax, 50
    call Delay

    ; Clear previous fireball position before moving again
    call GoToXY
    mWrite " "
    add dl, xDir
    add dh, yDir
    jmp L1

end_fire:
    ret
FireBallL2 ENDP


MovePlayer2 PROC
    mov dx, 0
    call GoToXY

checkInput:
    mov eax, 5
    call Delay

    ; Check for key press
    mov eax, 0
    call ReadKey
    mov inputChar, al

    cmp inputChar, VK_SPACE
    je shoot

    cmp inputChar, VK_ESCAPE
    je paused

    cmp inputChar, "w"
    je move

    cmp inputChar, "a"
    je move

    cmp inputChar, "x"
    je move

    cmp inputChar, "d"
    je move

    cmp inputChar, "q"
    je move

    cmp inputChar, "e"
    je move

    cmp inputChar, "z"
    je move
    
    cmp inputChar, "c"
    je move

    jmp chosen


move:
    mov al, inputChar
    mov direction, al
    
    jmp checkInput

paused:
    call Readkey
    mov inputchar, al
    cmp inputchar, 'p'
    je chosen
    jne paused
    ret

shoot:
    call FireBallL2
    jmp checkInput

chosen:
 ; Update and draw ball inside MovePlayer
 call PrintPlayer
 call PRINT_G4_L2
 call MOV_G4_L2
 ;call COLIDE_G4_L1
 jmp checkInput
  
ret
MovePlayer2 ENDP

;upperwall = 4
;lowerwall = 25
;rightwall = 95
;leftwall = 21

;;;;;;;;;;;;;;;;;;;
PRINT_G4_L2 PROC
    
    mov al, gameState
    cmp al,0
    je end_print_loop

    mov eax, white
    call SetTextColor
    mov dl, GH4_L2_x
    mov dh, GH4_L2_y 
    call Gotoxy
    mov al, "O"
    call WriteChar
    ret
end_print_loop:
    call GameOver
    ret
PRINT_G4_L2 ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MOV_G4_L2 PROC
 
    mov eax,RED
    call settextcolor

    mov dl, 22
    mov dh, 4
    call GOTOXY
    mov edx, offset BallCave2
    call writestring
    mov edx,0
    mov eax,0
    
    mov esi,1
    mov ecx, 303

  ; Erase the old position
    mov dl, GH4_L2_x
    mov dh, GH4_L2_y

    ; Generate a random color for the ball
    call LevelRandomColor2
    mov current_color, al  ; Store the generated color

    ; Apply the random color
    movzx eax, current_color
    call SetTextColor

    call GoToXY

    mov al, BallsofLevel2[esi]
    call writechar
    inc esi

    ; Determine movement based on the current wall
    mov al, current_wall

    cmp al, 1 ; Upper wall
    je move_upper

    cmp al, 2 ; Right wall
    je move_right_wall

    cmp al, 3 ; Lower wall
    je move_lower

    cmp al, 4 ; Left wall
    je move_left_wall

  move_upper:
        ; Move right on the upper wall
        mov eax, 20                 
        call delay
        inc GH4_L2_x
        mov al,rightwall
        cmp GH4_L2_x, al
        jle done ; If not at the end, continue
        ; Transition to the right wall
        mov current_wall, 2
        inc GH4_L2_y ; Move to the first cell of the right wall
        dec rightwall
        dec rightwall
        dec rightwall
        jmp done

    move_right_wall:
        ; Move down on the right wall
        mov eax, 40                 ;80
        call delay
        inc GH4_L2_y
        mov al, lowerwall
        cmp GH4_L2_y, al
        jle done ; If not at the end, continue
        ; Transition to the lower wall
        mov current_wall, 3
        dec GH4_L2_x ; Move to the first cell of the lower wall
        dec lowerwall
        dec lowerwall
        dec lowerwall
        jmp done

    move_lower:
        ; Move left on the lower wall
        mov eax, 20                 ;40
        call delay
        dec GH4_L2_x
        mov al, leftwall
        cmp GH4_L2_x, al
        jge done ; If not at the end, continue
        ; Transition to the left wall
        mov current_wall, 4
        dec GH4_L2_y ; Move to the first cell of the left wall
        inc leftwall
        inc leftwall
        inc leftwall
        jmp done

    move_left_wall:
        ; Move up on the left wall
        mov eax, 20          
        call delay
        dec GH4_L2_y
        mov al, upperwall
        cmp GH4_L2_y, al
        jge done ; If not at the end, continue
        ; Transition to the second line of the upper wall
        mov current_wall, 1
        inc GH4_L2_y ; Move to the second line
        inc upperwall
        inc upperwall
        inc upperwall
        jmp done

    done:
        ; Draw the new position
        mov dl, GH4_L2_x
        mov dh, GH4_L2_y
        call GoToXY
        
        mov al, BallsofLevel2[esi]
        call writechar 

        cmp GH4_L2_x, 55
        je REACHEDTURRET

        jmp exit_this_loop
REACHEDTURRET:
    cmp GH4_L2_y,13
    je REACHEDTURRET2

 cmp esi,ecx
 jl exit_this_loop

REACHEDTURRET2:
    mov gameState, 0
    call GameOver
exit_this_loop:
    ret

MOV_G4_L2 ENDP

COLIDE_G4_L1 PROC
    ; Check if the fireball and ball are at the same position
    mov al, fire_row
    cmp al, GH4_L1_y        ; Compare the fireball's row with the ball's row
    jne no_collision        ; If not equal, no collision

    mov al, fire_col
    cmp al, GH4_L1_x        ; Compare the fireball's column with the ball's column
    jne no_collision        ; If not equal, no collision

    ; Check if the colors are the same
    mov al, current_color   ; Get the fireball's color
    cmp al, mov_G4L1        ; Compare with the ball's color
    jne no_collision        ; If colors don't match, no collision

    ; Collision detected and colors match
    ; Clear the ball at the current position
    mov dl, GH4_L1_x
    mov dh, GH4_L1_y
    call GoToXY
    mWrite " "              ; Erase the ball

    ret

no_collision:
    ret
COLIDE_G4_L1 ENDP

;-------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-------------------------------------------------------------;
;-------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-------------------------------------------------------------;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;      LEVEL # 03     ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DrawWall3 PROC
    ; Draw level layout
    call clrscr
    ; Display Score, Lives, Level info

     ;NAME INPUT
    mov eax,White
    call SetTextColor
    mov dh,2
    mov dl,3
    call gotoxy
    mwrite "Name : "
    call crlf
    mwrite "    "
    mov eax,Cyan
    call SetTextColor
    mov edx,offset names
    mov ecx,lengthof names
    call WriteString

    mov eax,White
    call SetTextColor

    mov dl,19
    mov dh,2
    call Gotoxy
    mWrite <"Score: ">
    mov eax, Blue + (black * 16)
    call SetTextColor
    mov al, score
    call WriteDec

    mov eax, White + (black * 16)
    call SetTextColor
    mov dl,90
    mov dh,2
    call Gotoxy
    mWrite <"Lives: ">
    mov eax, Red + (black * 16)
    call SetTextColor
    mov al, lives
    call WriteDec

    mov eax, white + (black * 16)
    call SetTextColor
    mov dl,55
    mov dh,2
    call Gotoxy
    mov levelInfo,3
    mWrite "LEVEL " 
    mov al, levelInfo
    call WriteDec

    mov eax, Red
    call SetTextColor
    mov dl, 19
    mov dh, 4
    call Gotoxy

    mov esi, offset walls3
    mov counter1, 50
    mov counter2, 80
    movzx ecx, counter1
    printcolumn:
        mov counter1, cl
        movzx ecx, counter2
        printrow:
            mov eax, [esi]
            call WriteChar
            inc esi
        loop printrow
        
        dec counter1
        movzx ecx, counter1
        mov dl, 19
        inc dh
        call Gotoxy
    loop printcolumn

    ret
DrawWall3 ENDP

FireBallL3 PROC
    ; Fire a projectile from the player's current face direction
    mov dl, xPos      ; Fire column starts at the player's X position
    mov dh, yPos      ; Fire row starts at the player's Y position


    mov fire_col, dl  ; Save the fire column position
    mov fire_row, dh  ; Save the fire row position

    ; Determine direction
    mov al, direction
    cmp al, "w"
    je fire_up

    cmp al, "x"
    je fire_down

    cmp al, "a"
    je fire_left

    cmp al, "d"
    je fire_right

    cmp al, "q"
    je fire_upleft

    cmp al, "e"
    je fire_upright

    cmp al, "z"
    je fire_downleft

    cmp al, "c"
    je fire_downright

    jmp end_fire

fire_up:
    mov fire_row, 10
    mov fire_col, 57
    mov xDir, 0
    mov yDir, -1
    jmp fire_loop

fire_down:
    mov fire_row, 20
    mov fire_col, 57
    mov xDir, 0
    mov yDir, 1
    jmp fire_loop

fire_left:
    mov fire_col, 48
    mov fire_row, 16
    mov xDir, -2
    mov yDir, 0
    jmp fire_loop

fire_right:
    mov fire_col, 61
    mov fire_row, 16
    mov xDir, 2
    mov yDir, 0
    jmp fire_loop

fire_upleft:
    mov fire_row, 14
    mov fire_col, 51
    mov xDir, -1
    mov yDir, -1
    jmp fire_loop

fire_upright:
    mov fire_row, 13
    mov fire_col, 61
    mov xDir, 1
    mov yDir, -1
    jmp fire_loop

fire_downleft:
    mov fire_row, 20
    mov fire_col, 54
    mov xDir, -1
    mov yDir, 1
    jmp fire_loop

fire_downright:
    mov fire_row, 20
    mov fire_col, 61
    mov xDir, 1
    mov yDir, 1
    jmp fire_loop

fire_loop:
    add score,2
    mov dl,19
    mov dh,2
    call Gotoxy
    mWrite <"Score: ">
    mov eax, Blue + (black * 16)
    call SetTextColor
    mov al, score
    call WriteDec

    ; Initialise fire position
    mov dl, fire_col
    mov dh, fire_row
    call GoToXY

    ; Generate and set random color
    mov row_colour, dh
    mov col_colour, dl

    mov dl,65
    mov dh,2
    call GOTOXY
    call Level3RandomColoredFire

    mov dl, col_colour
    mov dh, row_colour
    call GOTOXY

    movzx eax, al        ; Get random color
    call SetTextColor

L1:
    ; Check fireball boundaries before moving
    cmp dl, 20            ; Left wall boundary
    jle end_fire

    cmp dl, 96            ; Right wall boundary
    jge end_fire

    cmp dh, 4             ; Upper wall boundary
    jle end_fire

    cmp dh, 27            ; Lower wall boundary
    jge end_fire

    ; Print fireball symbol and continue movement
    call GoToXY
    mWrite "*"

    ; Delay for smooth movement
    mov eax, 50
    call Delay

    ; Clear previous fireball position before moving again
    call GoToXY
    mWrite " "
    add dl, xDir
    add dh, yDir
    jmp L1

end_fire:
    ret
FireBallL3 ENDP


MovePlayer3 PROC
    mov dx, 0
    call GoToXY

checkInput:
    mov eax, 5
    call Delay

    ; Check for key press
    mov eax, 0
    call ReadKey
    mov inputChar, al

    cmp inputChar, VK_SPACE
    je shoot

    cmp inputChar, VK_ESCAPE
    je paused

    cmp inputChar, "w"
    je move

    cmp inputChar, "a"
    je move

    cmp inputChar, "x"
    je move

    cmp inputChar, "d"
    je move

    cmp inputChar, "q"
    je move

    cmp inputChar, "e"
    je move

    cmp inputChar, "z"
    je move
    
    cmp inputChar, "c"
    je move

    jmp chosen


move:
    mov al, inputChar
    mov direction, al
    
    jmp checkInput

paused:
    call Readkey
    mov inputchar, al
    cmp inputchar, 'p'
    je chosen
    jne paused
    ret

shoot:
    call FireBallL3
    jmp checkInput

chosen:
 ; Update and draw ball inside MovePlayer
 call PrintPlayer
 call PRINT_G4_L3
 call MOV_G4_L3
 ;call COLIDE_G4_L1
 jmp checkInput
  
ret
MovePlayer3 ENDP

;upperwall = 4
;lowerwall = 25
;rightwall = 95
;leftwall = 21

;;;;;;;;;;;;;;;;;;;
PRINT_G4_L3 PROC
    
    mov al, gameState
    cmp al,0
    je end_print_loop

    mov eax, white
    call SetTextColor
    mov dl, GH4_L2_x
    mov dh, GH4_L2_y 
    call Gotoxy
    mov al, "O"
    call WriteChar
    ret
end_print_loop:
    call GameOver
    ret
PRINT_G4_L3 ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MOV_G4_L3 PROC
    mov eax,RED
    call settextcolor

    mov dl, 22
    mov dh, 4
    call GOTOXY
    mov edx, offset BallCave3
    call writestring
    mov edx,0
    mov eax,0
    
    mov esi,1
    mov ecx, 303

    ; Erase the old position
    mov dl, GH4_L2_x
    mov dh, GH4_L2_y

    ; Generate a random color for the ball
    call LevelRandomColor3
    mov current_color, al  ; Store the generated color

    ; Apply the random color
    movzx eax, current_color
    call SetTextColor

    call GoToXY

    mov al, BallsofLevel3[esi]
    call writechar
    inc esi

    ; Determine movement based on the current wall
    mov al, current_wall

    cmp al, 1 ; Upper wall
    je move_upper

    cmp al, 2 ; Right wall
    je move_right_wall

    cmp al, 3 ; Lower wall
    je move_lower

    cmp al, 4 ; Left wall
    je move_left_wall

  move_upper:
        ; Move right on the upper wall
        mov eax, 10                 
        call delay
        inc GH4_L2_x
        mov al, tunnel_enter_x
        cmp GH4_L2_x, al
        je check_tunnel_entry
        jmp normal_upper_movement

     check_tunnel_entry:
        ; Prevent tunnel entry if the position is (50, 17)
        mov bl, 18
        cmp GH4_L2_y, bl
        je normal_upper_movement ; Skip the tunnel if at (50, 17)
        jmp enter_tunnel


    enter_tunnel:
        ; Enter the tunnel at (50, 12)
        mov bl, tunnel_enter_y
        cmp GH4_L2_y, bl
        jne normal_upper_movement
        
        ; Teleport to the tunnel
        mov al,tunnel_exit_x
        mov bl, tunnel_enter_y

        inc tunnel_enter_y

        mov GH4_L2_x, al
        mov GH4_L2_y, bl
        jmp normal_upper_movement

    normal_upper_movement:
        mov al, rightwall3
        cmp GH4_L2_x, al
        jle done ; If not at the end, continue
        ; Transition to the right wall
        mov current_wall, 2
        inc GH4_L2_y ; Move to the first cell of the right wall
        dec rightwall3
        jmp done

    move_right_wall:
        ; Move down on the right wall
        mov eax, 20                
        call delay
        inc GH4_L2_y
        mov al, lowerwall3
        cmp GH4_L2_y, al
        jle done ; If not at the end, continue
        
        ; Teleport to the last line of the left wall
        call GoToXY  ; Erase the current position
        mov al, "+"  ; Write space to clear current position
        call WriteChar
        
        mov al, lowerwall3
        mov bl, leftwall3

        ; Set new position on the left wall
        mov GH4_L2_y, al  ; Last line of left wall
        mov GH4_L2_x, bl   ; X-coordinate of left wall
        mov current_wall, 4      ; Switch to left wall movement

        ; Shrink the boundaries for inward movement
        inc leftwall3
        jmp done

    move_lower:
        ; Move left on the lower wall
        mov eax, 10              
        call delay
        dec GH4_L2_x
        mov al, leftwall3
        cmp GH4_L2_x, al
        jge done ; If not at the end, continue
        ; Transition to the left wall
        mov current_wall, 4
        dec GH4_L2_y ; Move to the first cell of the left wall

        ; Adjust boundaries for inward movement
        inc leftwall3
        ;dec lowerwall3
        jmp done

    move_left_wall:
        ; Move up on the left wall
        mov eax, 20           
        call delay
        dec GH4_L2_y
        mov al, upperwall3
        cmp GH4_L2_y, al
        jge done ; If not at the end, continue
        ; Transition to the second line of the upper wall
        mov current_wall, 1
        inc GH4_L2_y ; Move to the second line

        ; Adjust boundaries for inward movement
        inc upperwall3


        jmp done

    done:
        
        ; Draw the new position
        mov dl, GH4_L2_x
        mov dh, GH4_L2_y
        call GoToXY
        
        mov al, BallsofLevel3[esi]
        call writechar 

        cmp GH4_L2_x, 53
        je REACHEDTURRET

        jmp exit_this_loop

REACHEDTURRET:
    cmp GH4_L2_y, 18
    je REACHEDTURRET2

    cmp esi, ecx
    jl exit_this_loop

REACHEDTURRET2:
    mov gameState, 0
    call GameOver
exit_this_loop:
    ret

MOV_G4_L3 ENDP



;-------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-------------------------------------------------------------;
;-------------------------------------------------------------;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;-------------------------------------------------------------;

InitialiseScreen PROC
    ; Draw the level layout at the start
    call DrawWall1

    ; Set the initial player cannon position
    call PrintPlayer

    ret
InitialiseScreen ENDP

InitialiseScreen2 PROC
    ; Draw the level layout at the start
    call DrawWall2

    ; Set the initial player cannon position
    call PrintPlayer

    ret
InitialiseScreen2 ENDP

InitialiseScreen3 PROC
    ; Draw the level layout at the start
    call DrawWall3

    ; Set the initial player cannon position
    call PrintPlayer

    ret
InitialiseScreen3 ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;    MAIN    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

main PROC

call MENU_AR
ret
    
main ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MENU_AR proc
mov al, gameState
cmp al, 0
je END_GAME_LOOP

     ;MAIN SCREEN
    mov dl,10 
    mov dh,10
    ;mov eax,offset ZUMBA_ART
    mov eax,cyan
    call settextcolor
    call gotoxy
    mov edx,offset ZUMBA_ART
    call writestring

    call crlf
    call crlf
    call crlf
    call crlf
    call crlf
    call crlf
    call crlf


     call waitmsg
    call clrscr

    mov dl,10 
    mov dh,10
    ;mov eax,offset WELCOME_ART
    mov eax,Green
    call settextcolor
    call gotoxy
    mov edx,offset WELCOME_ART
    call writestring

    ;NAME INPUT
    mov eax,Red
    call SetTextColor
    mov dh,20
    mov dl,45
    call gotoxy
    mov edx,offset prompt1
    mov ecx,lengthof prompt1
    call writestring
    mwrite "                                                "

    mov edx,offset names
    mov ecx,20
    call readstring
    call clrscr

    mov eax,Red
    call SetTextColor

    ;START MENU
    point1:
        mov dl,70
        mov dh,3
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov menuSelect,1
    jmp start_tab

    point2:
        mov dl,80
        mov dh,12
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov menuSelect,2
    jmp start_tab

    point3:
        mov dl,70
        mov dh,22
        call gotoxy
        mov edx,offset POINTER
        call writestring
        mov menuSelect,3
    jmp start_tab


    start_tab:
    mov dl,0
    mov dh,1
    call gotoxy
    mov edx,offset START
    call writestring

    mov dl,0
    mov dh,10
    call gotoxy
    mov edx,offset INSTRUCTIONS
    call writestring

    mov dl,0
    mov dh,20
    call gotoxy
    mov edx,offset EXITED
    call writestring
    

    call readchar
    call clrscr
    cmp al,'1'
    je point1
    cmp al,'2'
    je point2
    cmp al,'3'
    je point3
    cmp al,13
    je selection


    selection:
    cmp menuSelect,1
    je startGame
    cmp menuSelect,2
    je INSTRUCTIONSSCREEN
    cmp menuSelect,3
    je exitGame

     mov eax,Blue
    call SetTextColor

    INSTRUCTIONSSCREEN:
    mov dl,20 
    mov dh,10
    call gotoxy
    mov eax, Green
    call SetTextColor
    mov edx,offset INSTRUCTIONS_SCREEN
    call writestring
    call readchar
    call clrscr
    cmp al,27
    je point2
    jmp INSTRUCTIONSSCREEN

    startGame:
        mov dl,50
        mov dh,3
        call gotoxy
        mov eax, White
        call SetTextColor
        mov edx, offset LevelsScreen
        call writeString

        call readchar
        cmp al,'1'
        je Level1
        cmp al,'2'
        je Level2
        cmp al,'3'
        je Level3
        cmp al,'4'
        je Level4
        cmp al,'5'
        je Level5
        cmp al,'6'
        je exitGame
        cmp al, '7'
        je ShowScores

    Level1:

    ; Initialize screen and emitter

     mov eax,White
    call SetTextColor

    call InitialiseScreen
    call MovePlayer1

    mWrite "Press any key to exit..."
    call ReadKey   ; Wait for key press


    Level2:
        ; Initialize screen and emitter

     mov eax,White
    call SetTextColor

    call InitialiseScreen2
    call MovePlayer2

    mWrite "Press any key to exit..."
    call ReadKey   ; Wait for key press

    Level3:
          ; Initialize screen and emitter

     mov eax,White
    call SetTextColor

    call InitialiseScreen3
    call MovePlayer3

    mWrite "Press any key to exit..."
    call ReadKey   ; Wait for key press

ShowScores:
    call SHOW_HIGH_SCORE
    jmp startGame

    Level4: 
        call clrscr
        jmp startGame
    Level5:
        call clrscr
        jmp startGame
    exitGame:
    call clrscr
    mov edx,offset GameEndScreen
    call writeString
    ret
    END_GAME_LOOP:


MENU_AR ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
WRITE_TO_FILE PROC  

    ; Open the input file to read existing data
    mov edx, OFFSET file              ; Load the address of the file name
    call openinputfile                ; Call to open the input file
    jc error_detected                 ; Jump to error handler if file cannot be opened
    mov HANDLER, eax                  ; Store the file handler

    ; Read data from the file into the buffer
    mov edx, OFFSET array             ; Load the address of the buffer
    mov ecx, BUFFER                   ; Load the buffer size
    call readfromfile                 ; Read data from the file
    mov eax, HANDLER                  ; Reload the file handler
    call closefile                    ; Close the input file

    ; Copy the file data into the result buffer
    mov esi, 0                        ; Index for the input array
    mov count, 0                      ; Initialize count to 0
L:  
    mov al, array[esi]                ; Load a byte from the input array
    mov result[esi], al               ; Store the byte in the result buffer
    cmp al, 0                         ; Check for null terminator
    je bye                            ; Exit loop if null terminator found
    inc count                         ; Increment count
    inc esi                           ; Increment array index
    jmp L                             ; Repeat loop

bye:  
    ; Create or open the output file
    mov edx, OFFSET file              ; Load the address of the file name
    call CREATEOUTPUTFILE             ; Call to create or open the output file
    mov HANDLER, eax                  ; Store the file handler

    ; Append a space to separate existing data
    mov result[esi], ' '              ; Add a space character
    inc esi                           ; Increment result index

    ; Append the player's name to the result buffer
    mov ebx, 0                        ; Initialize index for the name array
M:  
    mov al, names[ebx]                ; Load a byte from the name array
    mov result[esi], al               ; Store the byte in the result buffer
    cmp al, 0                         ; Check for null terminator
    je append_score                   ; Exit loop if null terminator found
    inc esi                           ; Increment result index
    inc ebx                           ; Increment name array index
    inc count                         ; Increment count
    jmp M                             ; Repeat loop

append_score:  
    ; Append '-Score'
    mov result[esi], '-'              ; Add a dash character
    inc esi                           ; Increment result index
    inc count                         ; Increment count

    movzx eax, score                  ; Load the score value
    mov ecx, 10                       ; Set the divisor for decimal conversion
    xor edi, edi                      ; Clear the digit count
convert_score_loop:  
    xor edx, edx                      ; Clear edx for division
    div ecx                           ; Divide eax by 10
    push dx                           ; Push the remainder onto the stack
    inc edi                           ; Increment the digit count
    test eax, eax                     ; Check if quotient is zero
    jnz convert_score_loop            ; Repeat if not zero

pop_score_loop:  
    pop dx                            ; Pop a digit from the stack
    add dl, '0'                       ; Convert digit to ASCII
    mov result[esi], dl               ; Store the digit in the result buffer
    inc esi                           ; Increment result index
    inc count                         ; Increment count
    dec edi                           ; Decrement digit count
    jnz pop_score_loop                ; Repeat until all digits are processed

    ; Append '-LEVEL' and the player's level
    mov result[esi], '-'              ; Add a dash character
    inc esi                           ; Increment result index
    inc count                         ; Increment count

    movzx eax, levelInfo              ; Load the level value
    mov ecx, 10                       ; Set the divisor for decimal conversion
    xor edi, edi                      ; Clear the digit count
convert_level_loop:  
    xor edx, edx                      ; Clear edx for division
    div ecx                           ; Divide eax by 10
    push dx                           ; Push the remainder onto the stack
    inc edi                           ; Increment the digit count
    test eax, eax                     ; Check if quotient is zero
    jnz convert_level_loop            ; Repeat if not zero

pop_level_loop:  
    pop dx                            ; Pop a digit from the stack
    add dl, '0'                       ; Convert digit to ASCII
    mov result[esi], dl               ; Store the digit in the result buffer
    inc esi                           ; Increment result index
    inc count                         ; Increment count
    dec edi                           ; Decrement digit count
    jnz pop_level_loop                ; Repeat until all digits are processed

    ; Write the result buffer to the output file
    mov eax, esi                      ; Load the final index as the byte count
    mov count, eax                    ; Store the byte count
    mov eax, HANDLER                  ; Load the file handler
    mov edx, OFFSET result            ; Load the address of the result buffer
    mov ecx, count                    ; Load the byte count
    call WRITETOFILE                  ; Write the data to the output file
    jc error_detected                 ; Jump to error handler if an error occurs
    jmp done                          ; Jump to the done label

error_detected:  
    ; Handle file error
    call crlf                         ; Print a new line
    mwrite "UNABLE TO OPEN FILE."     ; Display an error message

done:  
    ; Final message and program termination
    call crlf                         ; Print a new line
    mwrite "DONE WITH THE PROGRAM. [TERMINATING]" ; Display termination message
    call crlf                         ; Print a new line
    call crlf

    ret                               ; Return from the procedure
WRITE_TO_FILE ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SHOW_HIGH_SCORE PROC

    mov eax, magenta (brown*1)
    call SetTextColor
    call clrscr

    call crlf
    call crlf
    call crlf
    mwrite "               __    __   __              __               ______                                               "
    call crlf
    mwrite "              |  \  |  \ |  \            |  \             /      \                                              "
    call crlf
    mwrite "              | $$  | $$  \$$   ______   | $$____        |  $$$$$$\   _______   ______     ______     ______    "
    call crlf
    mwrite "              | $$__| $$ |  \  /      \  | $$    \       | $$___\$$  /       \ /      \   /      \   /      \   "
    call crlf
    mwrite "              | $$    $$ | $$ |  $$$$$$\ | $$$$$$$\       \$$    \  |  $$$$$$$|  $$$$$$\ |  $$$$$$\ |  $$$$$$\  "
    call crlf
    mwrite "              | $$$$$$$$ | $$ | $$  | $$ | $$  | $$       _\$$$$$$\ | $$      | $$  | $$ | $$   \$$ | $$    $$  "
    call crlf
    mwrite "              | $$  | $$ | $$ | $$__| $$ | $$  | $$      |  \__| $$ | $$_____ | $$__/ $$ | $$       | $$$$$$$$  "
    call crlf
    mwrite "              | $$  | $$ | $$  \$$    $$ | $$  | $$       \$$    $$  \$$     \ \$$    $$ | $$        \$$     \  "
    call crlf
    mwrite "               \$$   \$$  \$$  _\$$$$$$$  \$$   \$$        \$$$$$$    \$$$$$$$  \$$$$$$   \$$         \$$$$$$$  "
    call crlf
    mwrite "                              |  \__| $$                                                                        "
    call crlf
    mwrite "                               \$$    $$                                                                        "
    call crlf
    mwrite "                                \$$$$$$                                                                         "
    call crlf
    call crlf
    
    mwrite " *************************************** NAME           SCORE          LEVEL ****************************************"
    call crlf

    mov edx, OFFSET file
    call openinputfile
    jc error_detected
    mov HANDLER, eax
    mov edx, OFFSET array
    mov ecx, BUFFER
    call READFROMFILE
    mov eax, HANDLER
    call closefile

    mov eax, red
    call SetTextColor

    call crlf
    mwrite "---------------------------------------------------------------------------------------------------------------"
    call crlf
    mov dh, 20
    mov dl, 4
    call gotoxy
    mov edx, OFFSET array
    call writestring
    call crlf
    mwrite "---------------------------------------------------------------------------------------------------------------"
    call crlf
    call crlf
    call crlf
    call crlf
    call crlf

    call waitmsg
    call clrscr
    jmp done

    error_detected:
        call crlf
        mwrite "UNABLE TO OPEN FILE."

    done:
        call crlf
        mwrite "DONE WITH THE PROGRAM. [TERMINATING]"

RET
SHOW_HIGH_SCORE ENDP

GameOver PROC
    call clrscr
    mov gameState, 0
    mov dl,0 
    mov dh,14
    call gotoxy
    mov eax, Red
    call SetTextColor
    mov edx,offset GameOverScreen
    call writestring
    call crlf
    call WRITE_TO_FILE
    
    exit

GameOver ENDP

DrawPauseScreen PROC

call clrscr
mov dl,0 
mov dh,14
call gotoxy
mov eax, Red
call SetTextColor
mov edx,offset pauseScreen
call writestring
call crlf

ret

DrawPauseScreen ENDP

END main
