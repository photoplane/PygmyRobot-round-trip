CODE INITLF3
    import RPi.GPIO as GPIO     
    GPIO.setmode(GPIO.BOARD)
    GPIO.setwarnings(False)
    capteur3 = 22 # capteur optique 
    GPIO.setup(capteur3, GPIO.IN)
    init3 = GPIO.input(capteur3)
    etat3 = GPIO.input(capteur3)
    dpush(etat3)
END-CODE
