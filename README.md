
![Capture du 2024-10-27 13-29-59](https://github.com/user-attachments/assets/0979873f-cc47-4ed7-bb14-5a71dd0c5b63)


PygmyRobot round trip, it changes direction at each pass.

The PygmyRobot is equipped with four line following sensors. They have the following operating mode: for white they read the value 1 and 0 for black. For greater efficiency, the sensors are arranged inside the black line. In this application, the robot travels a straight line limited at both ends by black lines to make a half-turn (180°) clockwise and counterclockwise. To achieve this reversal of direction, a variable, called CCP, must be set up; at each pass it will record a 0 or 1, which will give the direction of rotation to the robot.

Hippodrome round trip.

The robot changes direction at each lap of the racetrack.
The PygmyRobot is equipped with four line-following sensors. They have the following operating mode: for white they read the value 1 and 0 for black. For greater efficiency, the sensors are arranged inside the black line. In this application, the robot travels a straight line limited at both ends by black lines to make a half-turn (180°) clockwise and counterclockwise. To achieve this reversal of direction, a variable named CCP must be set up; at each pass it will record a 0 or 1, which will give the direction of rotation to the robot.

The code in Pygmy Forth:

VARIABLE CCP ( setting up a variable )

: STCM ( -- )

500 FOR ( use of a FOR NEXT loop limited to 500 )

INITLF1 INITLF2 AND 0= IF MOTORAV ( if the two central sensors detect black, i.e. 0, forward)

THEN ( end of conditional connection )

INITLF2 0= NOT IF TURNG MOTORAV ( if this sensor is not on white turn left )

INITLF1 0= NOT IF TURND MOTORAV THEN ( if this sensor is not on white turn right )

THEN ( end of conditional connection )

INITLF1 INITLF2 INITLF3 INITLF4 + 0=

IF ( if the 4 sensors are on black)

CCP @ 0= IF TURNDPI 1 CCP ! (we go to this condition, if CCP is 0 half turn to the right)

ELSE TURNGPI 0 CCP ! (otherwise half turn to the left)

THEN THEN (end of the conditional branch)
NEXT

;![QuatreCapteurSuiveCoteCircuit](https://github.com/user-attachments/assets/741c5867-5506-43ec-8074-e568392f5999)

[GPIO.pdf](https://github.com/user-attachments/files/17533583/GPIO.pdf)



https://github.com/user-attachments/assets/d288fb15-2a60-436b-b199-c34861613d56



https://github.com/user-attachments/assets/096ffbe1-43ef-493c-aed2-6ba43dd1d1e3



