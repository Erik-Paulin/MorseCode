#include <Arduino.h> // Including Arduino library for access to its functions and definitions

// Function prototypes
void choice();         // Function prototype for choosing conversion direction
void morse_to_eng_2(); // Function prototype for converting Morse code to English

// Define Morse code and English arrays
String morse[] = { // Array containing Morse code representations of characters
    "*-", "-***", "-*-*", "-**", "*", "**-*", "--*", "****", "**", "*---",
    "-*-", "*-**", "--", "-*", "---", "*--*", "--*-", "*-*", "***", "-",
    "**-", "***-", "*--", "-**-", "-*--", "--**", "*----", "**---", "***--",
    "****-", "*****", "-****", "--***", "---**", "----*", "-----", "*-*-*-",
    "--**--", "---***", "**--**", "*----*", "-****-", "-**-*", "******"};

String engltr[] = { // Array containing English representations of characters
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N",
    "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3",
    "4", "5", "6", "7", "8", "9", "0", ".", ",", ":", "?", "'", "-", "/", " "};

void setup()
{
  Serial.begin(9600);  // Initialize serial communication with baud rate 9600
  choose_conversion(); // Call function to choose conversion direction
}

void loop()
{
  choose_conversion(); // Loop function to continuously choose conversion direction
}

// Function for converting Morse code to English
void morse_to_eng_2()
{
  String morseCode = ""; // Variable to store input Morse code

  while (true)
  {
    while (!Serial.available())
      ;                         // Wait for user input
    char input = Serial.read(); // Read user input

    if (input == '\'')
    {                    // Check if input is dot
      Serial.print("'"); // Echo the input
      morseCode += '*';  // Convert dot to Morse code
    }
    else if (input == '-')
    {                    // Check if input is dash
      Serial.print("-"); // Echo the input
      morseCode += '-';  // Append to Morse code string
    }
    else if (input == ' ')
    {                    // Check if input is space
      Serial.print(" "); // Echo the input
      morseCode += ' ';  // Append space to indicate letter separation
    }
    else if (input == '\n')
    { // Check if input is end of line
      // End of input, break the loop
      break;
    }
  }

  // Now we have the Morse code, let's translate it to English
  String english = ""; // Variable to store translated English text

  // Split Morse code into letters
  String letter = "";
  for (unsigned int i = 0; i < morseCode.length(); i++)
  {
    if (morseCode[i] == '*' || morseCode[i] == '-')
    {
      letter += morseCode[i];
    }
    else if (morseCode[i] == ' ')
    {
      // End of letter, find the English equivalent
      for (unsigned int j = 0; j < sizeof(morse) / sizeof(morse[0]); j++)
      {
        if (morse[j] == letter)
        {
          english += engltr[j];
          break;
        }
      }
      // Add space to separate letters
      english += " ";
      letter = ""; // Reset for the next letter
    }
  }

  // Print translated English text
  Serial.print("English: ");
  Serial.print(english);
}

// Function for converting English to Morse code
void eng_to_morse_time()
{
  String input = ""; // Variable to store user input

  while (true)
  {
    while (!Serial.available())
      ;                      // Wait for user input
    char ch = Serial.read(); // Read user input

    if (ch == '\n')
    { // Check if input is end of line
      // End of input, break the loop
      break;
    }

    input += ch;      // Append input to string
    Serial.print(ch); // Echo the input
  }
  Serial.println(""); // Print new line

  // Translate the input string to Morse code
  String morseCode = ""; // Variable to store Morse code

  for (unsigned int i = 0; i < input.length(); i++)
  {
    char ch = toupper(input.charAt(i)); // Convert character to uppercase
    for (unsigned int j = 0; j < sizeof(engltr) / sizeof(engltr[0]); j++)
    {
      if (ch == engltr[j].charAt(0))
      {                        // Check for match in English letters array
        morseCode += morse[j]; // Append Morse code equivalent to string
        morseCode += " ";      // Add space to separate letters
        break;                 // Break loop once match is found
      }
    }
  }

  // Print Morse code
  Serial.print("Morse Code: ");
  Serial.println(morseCode);
}

// Function for choosing conversion direction
void choose_conversion()
{
  Serial.println("What do you want to do?");                                                                                            // Prompt user for choice
  Serial.println("[1] Convert English to Morse Code");                                                                                  // Option for English to Morse conversion
  Serial.println("[2] Convert Morse Code to English");                                                                                  // Option for Morse to English conversion
  Serial.println("For choice [1], type: 1 <your message here> then press enter.");                                                      // Instruction for English to Morse conversion
  Serial.println("For choice [2], type: 2 <your Morse code here> then press enter. (For Morse code, use ' for dots and - for dashes)"); // Instruction for Morse to English conversion
  while (!Serial.available())
    ;                               // Wait for user input
  int choice = Serial.read() - '0'; // Read user choice and convert to integer
  Serial.println();                 // Print new line

    if (choice == 1)
    {                      // Check if user chose option 1
      eng_to_morse_time(); // Call function to convert English to Morse code
    }
    else if (choice == 2)
    {                   // Check if user chose option 2
      morse_to_eng_2(); // Call function to convert Morse code to English
    }
    else
    {                                    // If user entered an invalid choice
      Serial.println("Invalid choice!"); // Print error message
    }
  }
