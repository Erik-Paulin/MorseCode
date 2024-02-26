#include <Arduino.h>

// Function prototypes
void choice();
void morse_to_eng_2();

// Define Morse code and English arrays
String morse[] = {
  "*-", "-***", "-*-*", "-**", "*", "**-*", "--*", "****", "**", "*---",
  "-*-", "*-**", "--", "-*", "---", "*--*", "--*-", "*-*", "***", "-",
  "**-", "***-", "*--", "-**-", "-*--", "--**", "*----", "**---", "***--",
  "****-", "*****", "-****", "--***", "---**", "----*", "-----", "*-*-*-",
  "--**--", "---***", "**--**", "*----*", "-****-", "-**-*", "******"
};

String engltr[] = {
  "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N",
  "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3",
  "4", "5", "6", "7", "8", "9", "0", ".", ",", ":", "?", "'", "-", "/", " "
};

void setup() {
  Serial.begin(9600);
  choose_conversion();
}

void loop() {
  choose_conversion();
}

void morse_to_eng_2() {
  String morseCode = "";

  while (true) {
    while (!Serial.available()); // Wait for user input
    char input = Serial.read();

    if (input == '\'') {
      Serial.print("'"); // Echo the input
      morseCode += '*'; // Convert dot to Morse code
    } else if (input == '-') {
      Serial.print("-"); // Echo the input
      morseCode += '-'; // Append to Morse code string
    } else if (input == ' ') {
      Serial.print(" "); // Echo the input
      morseCode += ' '; // Append space to indicate letter separation
    } else if (input == '\n') {
      // End of input, break the loop
      break;
    }
  }

  // Now we have the Morse code, let's translate it to English
  String english = "";

  // Split Morse code into letters
  String letter = "";
  for (unsigned int i = 0; i < morseCode.length(); i++) {
    if (morseCode[i] == '*' || morseCode[i] == '-') {
      letter += morseCode[i];
    } else if (morseCode[i] == ' ') {
      // End of letter, find the English equivalent
      for (unsigned int j = 0; j < sizeof(morse) / sizeof(morse[0]); j++) {
        if (morse[j] == letter) {
          english += engltr[j];
          break;
        }
      }
      // Add space to separate letters
      english += " ";
      letter = ""; // Reset for the next letter
    }
  }

  Serial.print("English: ");
  Serial.print(english);
  
  
}

// Function for converting English to Morse code
void eng_to_morse_time() {
  String input = "";

  while (true) {
    while (!Serial.available()); // Wait for user input
    char ch = Serial.read();

    if (ch == '\n') {
      // End of input, break the loop
      break;
    }

    input += ch;
    Serial.print(ch); // Echo the input
  }
  Serial.println("");
  // Translate the input string to Morse code
  String morseCode = "";

  for (unsigned int i = 0; i < input.length(); i++) {
    char ch = toupper(input.charAt(i));
    for (unsigned int j = 0; j < sizeof(engltr) / sizeof(engltr[0]); j++) {
      if (ch == engltr[j].charAt(0)) {
        morseCode += morse[j];
        morseCode += " "; // Add space to separate letters
        break;
      }
    }
  }

  Serial.print("Morse Code: ");
  Serial.println(morseCode);
}

// Function for choosing conversion direction
void choose_conversion() {
  Serial.println("What do you want to do?");
  Serial.println("[1] Convert English to Morse Code");
  Serial.println("[2] Convert Morse Code to English");
  Serial.println("For choice [1] press type: 1<your message here> then press enter.");
  Serial.println("For choice [2] press type: 2<your morse code here> then press enter.(for morse code use ' for dots and - for dashes)");
  while (!Serial.available());
  int choice = Serial.read() - '0';
  Serial.println();

    if (choice == 1) {
    eng_to_morse_time();
  } else if (choice == 2) {
    morse_to_eng_2();
  } else {
    Serial.println("Invalid choice!");
  }
}