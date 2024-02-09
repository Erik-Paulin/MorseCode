// #include MorseCode.h

// void setup{

// };

// void loop{

// };

// void decodeltr{

// };

/*
Cet exemple mesure le temps entre deux pressions sur un interrupteur.
*/

// INCLUDE CHRONO LIBRARY : http://github.com/SofaPirate/Chrono
#include <Chrono.h>

// L'interrupteur est branché à la broche 3 avec un pull-up externe :
#define INPUT_PIN 3

Chrono myChrono;
int previousButtonState;

void setup()
{

    // Demarrer la communication serie a  57600 baud.
    Serial.begin(57600);

    // Configurer la broche INPUT_PIN en tant qu'entree
    pinMode(INPUT_PIN, INPUT);

    previousButtonState = digitalRead(INPUT_PIN);
}

void loop()
{

    int newButtonState = digitalRead(INPUT_PIN);

    if (previousButtonState != newButtonState)
    {
        previousButtonState = newButtonState;

        if (newButtonState == LOW && myChrono.hasPassed(10))
        {
            Serial.print(myChrono.elapsed());
        }

        myChrono.restart();
    }
}
