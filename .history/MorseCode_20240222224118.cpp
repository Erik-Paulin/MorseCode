// Function for converting Morse code to English letters
void morse_to_eng(char *morse_code) {
    int i = 0;
    while (morse_code[i]) {
        if (morse_code[i] == '*') {
            Serial.print(engltr[i]);
            i = 0;
        } else if (morse_code[i] == '-') {
            i++;
        } else if (morse_code[i] == ' ') {
            Serial.print(" ");
            i = 0;
        }
        i++;
    }
}

void setup() {
    Serial.begin(57600); // Begin serial communication
}

void loop() {
    Serial.println("Enter Morse code using '*' for dot and '-' for dash, separated by space: ");
    while (!Serial.available()) {} // Wait for input
    String input = Serial.readString(); // Read input from serial monitor
    morse_to_eng(input.c_str()); // Convert Morse code to English
}
