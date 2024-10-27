( Aller-Retour )
: HI ." Bonjour tout le monde" ;

: robot CR ."           _  " CR ."        __|_|__   " CR ."       |  o o  |  " CR
."      [|   !   |]  " CR    ."     __|  <=>  |__  " CR  ."    |  ^^^^^^^^   | " CR  ."    |  | robot |  |  " CR
."    |  |_______|  |    " CR ."    |__|       |__|    " CR
; 
 
robot CR
HI  CR

( my own return stack - ma propre pile de retour R )
VARIABLE R   
: >R  R ! ;
: R> R @ ;

( timer env. 1 sec )
: MS ( n -- n sec ) 34333 * FOR I DROP NEXT ;
: X 100 FOR DROP NEXT ;


CODE PAGE
    print('\033c')

( Primotives Pygmy Forth with Python )
END-CODE
" MotorAV.fth" LOAD
" initlf1.fth" LOAD
" initlf2.fth" LOAD
" initlf3.fth" LOAD
" initlf4.fth" LOAD
" MotorStop.fth" LOAD
" TurnD.fth"  LOAD
" TurnG.fth" LOAD
" TurnGpi.fth" LOAD
" TurnDpi.fth" LOAD


( applications )
( Round trip )

: TOP> 18  FOR MOTORAV NEXT ; 
: TOPLF BEGIN INITLF1 INITLF2 + 0=  IF MOTORAV THEN INITLF1 1 =  IF TURND  MOTORAV THEN INITLF2  1 =  IF TURNG  MOTORAV THEN INITLF3  0=  IF TOP> TURND90 MOTORAV THEN INITLF4   0=  IF TOP> TURNG90 MOTORAV THEN INITLF1 INITLF2 + 2 =  IF MOTORSTOP  THEN AGAIN ;
: T TOPLF ;

: TOPSL BEGIN INITLF2 INITLF1 AND 0=  IF MOTORAV THEN INITLF1 0= NOT IF TURND MOTORAV THEN INITLF2 0= NOT IF TURNG MOTORAV THEN INITLF2 INITLF1 AND 0= NOT UNTIL ;
: L TOPSL ;

: t INITLF1 ." centre-GAUCHE" . CR INITLF2 ." centre-DROITE" . CR INITLF3  ." DROITE" . CR INITLF4  ." GAUCHE" .  CR  ;

VARIABLE CCP
: STCM ( -- ) 500 FOR  INITLF1 INITLF2 AND 0=  IF MOTORAV   THEN  INITLF2 0= NOT IF TURNG MOTORAV  THEN  INITLF1 0= NOT IF TURND MOTORAV THEN  INITLF1 INITLF2 INITLF3 INITLF4 + 0= IF CCP @ 0= IF TURNDPI  1 CCP ! ELSE TURNGPI 0 CCP ! THEN THEN NEXT ;
: Q ( -- )  STCM ;

WORDS CR
