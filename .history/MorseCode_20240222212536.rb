
# Code for tranlating morse to English
  # Main function for converting morse code to English
def morse_to_eng(morse,engltr)
  str=[]
  while str[str.length-1]!="."                            # Stops the convertion if the finished string ends with a period
    h=[]
    g=0                                                   # g mesures length of pulses for convertion
    disp=""
    while g < 3.00                                       # Differentiates words
      start1=Time.now                                     # Gets timestamp
      g=gets                                              # Waits for user
      stop1=Time.now                                      # Gets timestamp
      g=(stop1-start1)                                    # Gets pulse-length
      if g < 3.00                                        # Checks wether or not the length is valid as a puls for letter or if it is puls for separating letters
      #if myChrono.elapsed < 3.5 s                        # Option if using crono to mesure length
        h << g                                            # Adds puls to collection for convertion
        if g < 1.000                                      # Adds dot to morse display
          disp << "*"
        elsif g > 1.000                                   # Adds dash to morse display
          disp << "-"
        end                                                
        # h.append(myChrono.elapsed())                    # Option if using crono to mesure length
      else                                                # Letter done, sets for convertion to string
        str << morse_to_engltr(engltr,convert(h),morse)   # Calls function morse_to_engltr with arguments for the list of English letters and the return of the function convert with argument h aswell as list of morse code
        disp=""
      end
      puts disp
      puts str.join
    end
  end
  str=str.join()                                          # Puts the translated morsecode letters into a single string for ease of read
  return str                                              # Returns the finished string 
end

  # Function for converting pulsdurations to either a dot or a dash
def convert(lttr)
  morse_lttr = ""                                         # Creates variable morse_lttr
  lttr.each do |duration|                                 # Goes through each item in lttr and converts to either dot or dash
      if duration <= 1.50                                 # When puls duration is shorter than 1.5 it's a dot
        morse_lttr += "*"                                 # Adds dot to return string
      elsif duration > 1.50 && duration < 3.0            # When puls is between 1.5 and 3.0 it's a dash
        morse_lttr += "-"                                 # Adds dash to return string
      end
  end
  return morse_lttr                                       # Returns morse code string
end

  # Function for converting morse code string to English letter
def morse_to_engltr(engl, inmorse,list)                   
  index = index(inmorse, list)                            # Calls function index to determine what index input has in list
  lttr = engl.dup[index]                                  # Creates an out of place letter for use by using comparrison number and a list of English characters
  return lttr                                             # Returns the converted letter
end

  # Function for getting list position for an item for use in comparing
def index(input, list)                                    
  match_index = nil                                       # Creates variable match_index 
  list.each_with_index do |item, index|                   # Goes through list to find match
    if input == item                                      # Check that item is right
      match_index = index                                 # Assigns the found index to the index used to match in translation lists
      break                                               # Stop searching once a match is found
    end
  end
  if match_index.nil?                                     # Checks if the match_index variable still is nil
    puts "Input does not match any item in the list (morse > eng)" # Error message
  end
  return match_index                                      # Returns index for comparrison
end 


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
  if i == 1                                               # Checks answer if 1
    puts "Write a phrase in all caps"                     # Gives short instruction on what must be done for the function to work
    p eng_to_morse_time(morse,engltr)                       # Calls the corresponding main function
  elsif i == 2                                            # Checks answer if 2
    if 
      
    elsif 
      
    end
    puts "Enter signal durations, use a signal longer than 4 second (4000 milis) to differentiate between letters, finish with '.' " # Gives short instruction on what must be done for the function to work
    puts "Note that pulses counted by time between presses"
    puts "Note that a dot is > 1.5 second long and a dash is between 1.5 and 3.0 seconds long"
    puts "Press enter to start"
    d=gets.chomp                                          # Creates a stop so that user can prepare
    puts morse_to_eng(morse,engltr)                       # Calls the corresponding main function
  else                                                    # Else-case if user gives input other than 1 or 2
    puts "This option is not avalable"                    # Corresponding message of inavalability
  end
end

# List of letters in morse code corresponding to the same list in english
morse = ["*-","-***","-*-*","-**","*","**-*","--*","****","**","*---","-*-","*-**","--","-*","---","*--*","--*-","*-*","***","-","**-","***-","*--","-**-","-*--","--**","*----","**---","***--","****-","*****","-****","--***","---**","----*","-----","*-*-*-","--**--","---***","**--**","*----*","-****-","-**-*","******"]

# List of letters in english corresponding to the same list in morse code
engltr = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0",".",",",":","?","'","-","/"," "]

choice(morse,engltr)                                    # Starting the code