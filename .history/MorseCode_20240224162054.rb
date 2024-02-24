
# Code for tranlating morse to English
  # Main function for timed morse



# Code for converting English to morse code
  # Main function for converitng English to morse pulses
def eng_to_morse_time(morse,engltr)
  str = gets.chomp                                        # Gets string to be converted from user
  str = str.chars                                         # divides string into letter array for convertion
  time=convert!(eng_to_morse(morse,str,engltr))           # Assings return variable with result from convert! function which inturn uses return from eng_to_morse function that uses arguments for list of letters in morse(morse), the string user wants converted and list of english letters(engltr)
  return time                                             # Returns array with all puls-lengths for the morse code variant of the string
end

  # Function used for converting english letters to morse code
def eng_to_morse(morse,ineng,engltr)
  lttr =[]                                                # Creates array to store morse code letters
  i=0                                                     # Creates incrementer
  while i<ineng.length                                    # Loop for all letters
    index = index!(ineng[i], engltr)                      # Convert letter to index number
    lttr << morse.dup[index]                              # Add morse code letter on place of index to morse code array
    i+=1                                                  # Increment i
  end
  p lttr
  return lttr                                             # Return string converted to dot and dash 
end

  # Function used for converting dot and dash to pulses
def convert!(morse)
  time = []                                               # Creates array to store pulse-lengths
  i=0                                                     # Creates incrementer
  while i<morse.length                                    # Loop for all items from array morse
    morse[i].chars.each do |duration|                     # Splits items to characters and loops for all characters
      if duration == "*"                                  # If character is a dot add a puls of length 1.0 to time
        time << 1.0
      elsif duration == "-"                               # If character is a dash add a puls of length 3.0 to time
        time << 3.0
      end
    end
    time << 4.00                                          # Add long puls to differentiate between letters
    i+=1                                                  # Increments i
  end
  return time                                             # Return array with all puls-lengths 
end

  # Function for retreving the indet for incerted element from a list
def index!(wrd, engltr)
  match_index = nil                                       # Create variable match index
  engltr.each_with_index do |item, index|                 # Goes through the list to find a match
    if wrd == item                                        # Check that item is right
      match_index = index                                 # Assigns the found index to the index used to match in translation lists
      break                                               # Stop searching once a match is found
    end
  end
  if match_index.nil?                                     # Checks if the match_index variable still is nil
    puts "Input does not match any item in the list (morse > eng)" # Error message
  end
  return match_index                                      # Returns index for comparrison
end 

# Code for UI and lists
  # Function for UI
def choice(morse,engltr)
  puts "What do you want to do?"                          # Ask user what function is desired
  puts "[1] convert English to morse code"                # Gives option 1
  puts "[2] convert morse code to English"                # Gives option 2
  i = gets.chomp.to_i                                     # Get input from user regarding function
  if i == 1                                               # Checks if answer is 1
    puts "Write a phrase in all caps"                     # Gives short instruction on what must be done for the function to work
    p eng_to_morse_time(morse,engltr)                     # Calls the corresponding main function
  elsif i == 2                                            # Checks if answer is 2
    puts "[1] True morse experience"                      # Gives option 1
    puts "[2] written dots and dashes"                    # Gives option 2
    d= gets.chomp.to_i                                    # Gets user input
    if d == 1                                             # Checks if answer is 1
      puts "Enter signal durations, use a signal longer than 4 second (4000 milis) to differentiate between letters, finish with '.' " # Gives short instruction on what must be done for the function to work
      puts "Note that pulses counted by time between presses"
      puts "Note that a dot is > 1.5 second long and a dash is between 1.5 and 3.0 seconds long"
      puts "Press enter to start"
      d=gets.chomp                                        # Creates a stop so that user can prepare
      puts morse_to_eng_1(morse,engltr)                   # Calls the corresponding main function
    elsif d==2                                            # Checks if answer is 2
      puts "dot = * dash = -, finish with '*-*-*-'"       # Gives short instruction on what must be done for the function to work
      morse_to_eng_2(morse,engltr)                        # Calls the corresponding main function
    end
    
  else                                                    # Else-case if user gives input other than 1 or 2
    puts "This option is not avalable"                    # Corresponding message of inavalability
  end
end

# List of letters in morse code corresponding to the same list in english
morse = ["*-","-***","-*-*","-**","*","**-*","--*","****","**","*---","-*-","*-**","--","-*","---","*--*","--*-","*-*","***","-","**-","***-","*--","-**-","-*--","--**","*----","**---","***--","****-","*****","-****","--***","---**","----*","-----","*-*-*-","--**--","---***","**--**","*----*","-****-","-**-*","******"]

# List of letters in english corresponding to the same list in morse code
engltr = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0",".",",",":","?","'","-","/"," "]

choice(morse,engltr)                                    # Starting the code