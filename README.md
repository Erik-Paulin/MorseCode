
Morse Code Converter
This Arduino code serves as a Morse code converter, allowing users to translate text between English and Morse code. It provides functionality for both English to Morse code conversion and Morse code to English conversion.

Features:
Convert English text to Morse code.
Convert Morse code to English text.

Hardware Requirements:
Arduino board
Serial monitor interface (e.g., Arduino IDE serial monitor)

Installation:
Connect your Arduino board to your computer.
Open the Arduino IDE.
Copy the provided code into a new sketch in the Arduino IDE.
Upload the sketch to your Arduino board.

Usage:
Open the serial monitor in the Arduino IDE.
Follow the on-screen prompts to choose the desired conversion direction:
Type 1 <your message here> to convert English text to Morse code.
Type 2 <your Morse code here> to convert Morse code to English text.
Press Enter after entering your message or Morse code.
View the converted text in the serial monitor output.

Example:
To convert the English text "HELLO" to Morse code, type 1 HELLO and press Enter.
To convert the Morse code ".... . .-.. .-.. ---" to English text, type 2 .... . .-.. .-.. --- and press Enter.

Notes:
For Morse code input, use ' for dots and - for dashes.
Ensure that the baud rate in the code matches the baud rate in the serial monitor (default is 9600).

Troubleshooting:
If encountering issues, check the serial monitor for error messages.
Verify that the Arduino board is properly connected and powered.
