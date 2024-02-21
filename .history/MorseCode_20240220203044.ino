#include <Arduino.h>
#include <Chrono.h>

// INCLUDE CHRONO LIBRARY: http://github.com/SofaPirate/Chrono
Chrono pressTimer;

// Define pin for the button
#define BUTTON_PIN 4

int index(String input, String list[], int listSize) {
  int matchIndex = -1;

  for (int i = 0; i < listSize; i++) {
    if (input.equals(list[i])) {
      matchIndex = i;
      break; // Stop searching once a match is found
    }
  }

  if (matchIndex == -1) {
    Serial.println("Input does not match any item in the list");
  }

  return matchIndex;
}

String morse_to_engltr(String engl[], String inmorse, String morse[], int listSize) {
  int idx = index(inmorse, morse, listSize);
  String lttr = engl[idx];
  return lttr;
}

String convert(int durations[], int durationSize) {
  String morseLttr = "";
  for (int i = 0; i < durationSize; i++) {
    if (durations[i] < 300) {
      morseLttr += "*";
    } else if (durations[i] > 300 && durations[i] < 800) {
      morseLttr += "-";
    }
  }
  return morseLttr;
}

String morse[] = {"*-","-***","-*-*","-**","*","**-*","--*","****","**","*---","-*-","*-**","--","-*","---","*--*","--*-","*-*","***","-","**-","***-","*--","-**-","-*--","--**","*----","**---","***--","****-","*****","-****","--***","---**","----*","-----","*-*-*-","--**--","---***","**--**","*----*","-****-","-**-*","******"};
String engltr[] = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0",".",",",":","?","'","-","/"," "};

void setup() {
  Serial.begin(9600);

  // Set the button pin as input with pull-up resistor
  pinMode(BUTTON_PIN, INPUT_PULLUP);
}

void loop() {
  String str = "";

    // Read the state of the button
  int buttonState = digitalRead(BUTTON_PIN);

  // If the button is pressed
  if (buttonState == HIGH) {
    // Start timing the press duration
    pressTimer.restart();

    // Loop until the button is released
    while (digitalRead(BUTTON_PIN) == HIGH) {
      // Continue timing the press duration
    }
    // Get the duration of the button press
    long pressDuration = pressTimer.elapsed();


  while (str.charAt(str.length() - 1) != '.') {
    int h[100];
    int g = 0;

    while (g < 800) {
      g = pressTimer.elapsed();
      if (g > 0) {
        h[g] = g;
      } else {
        String converted = convert(h, sizeof(h)/sizeof(h[0]));
        String engltr_str = morse_to_engltr(engltr, converted, morse, sizeof(morse)/sizeof(morse[0]));
        str += engltr_str;
        Serial.println(str);
      }
    }
  }

  Serial.println(str);


    // Print the press duration
    // Serial.print("Press duration: ");
    // Serial.print(pressDuration);
    // Serial.println(" milliseconds");

    pressTimer.restart();
  }
}