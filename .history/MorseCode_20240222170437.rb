
# Code for tranlating morse to English
  #Main function for converting morse code to English
def morse_to_eng(morse,engltr)
  str=[]
  while str[str.length-1]!="."                            #Stops the convertion if the finished string ends with a period
    h=[]
    g=0                                                   # g mesures length of pulses for convertion
    while g < 800                                         # Differentiates words
      g = gets.chomp.to_i                                 # gets puls length
      if g < 800                                          # Checks wether or not the length is valid as a puls for letter or if it is puls for separating letters
      #if myChrono.elapsed < 800 #option if using crono to mesure length
        h << g                                            # Adds puls to collection for convertion
        # h.append(myChrono.elapsed()) #option if using crono to mesure length
      else                                                # Letter done, sets for convertion to string
        str << morse_to_engltr(engltr,convert(h),morse)   # Calls function morse_to_engltr with arguments for the list of English letters and the return of the function convert with argument h aswell as list of morse code
      end
    end
  end
  str=str.join()                                          # puts the translated morsecode letters into a single string for ease of read
  return str                                              # returns the finished string 
end

  # Function for converting pulsdurations to either a dot or a dash
def convert(lttr)
  morse_lttr = ""                                         # Creates variable morse_lttr
  lttr.each do |duration|                                 # goes through each item in lttr and converts to either dot or dash
      if duration <= 300                                  # when puls duration is shorter than 300 it's a dot
        morse_lttr += "*"                                 # adds dot to return string
      elsif duration > 300 && duration < 800              # when puls is between 300 and 800 it's a dash
        morse_lttr += "-"                                 # Adds dash to return string
      end
  end
  return morse_lttr                                       # Returns morse code string
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

  # Function for converting morse code string to English letter
def morse_to_engltr(engl, inmorse,list)                   
  index = index(inmorse, list)                            # 
  lttr = engl.dup[index]                                  # Creates an out of place letter for use by using comparrison number and a list of English characters
  return lttr                                             # Returns the converted letter
end



  #
def convert!(morse)
  time = []
  i=0
  while i<morse.length
    morse[i].chars.each do |duration|
      if duration == "*"
        time << 100
      elsif duration == "-"
        time << 700
      end
    end
    time << 1000
    i+=1
  end
  return time
end

def index!(wrd, engltr)
  match_index = nil
  engltr.each_with_index do |item, index|
    if wrd == item
      match_index = index
      break  # Stop searching once a match is found
    end
  end
  if match_index.nil?
    puts "Input does not match any item in the list (eng > morse)"
  end

  return match_index
end 

def eng_to_morse(morse,ineng,engltr)
  lttr =[]
  i=0
  while i<ineng.length
    index = index!(ineng[i], engltr)
    lttr << morse.dup[index]
    i+=1
  end
  return lttr
end

def eng_to_morse_time(morse,engltr)
  str = gets.chomp
  str = str.chars
  time=convert!(eng_to_morse(morse,str,engltr))
  return time
end

morse = ["*-","-***","-*-*","-**","*","**-*","--*","****","**","*---","-*-","*-**","--","-*","---","*--*","--*-","*-*","***","-","**-","***-","*--","-**-","-*--","--**","*----","**---","***--","****-","*****","-****","--***","---**","----*","-----","*-*-*-","--**--","---***","**--**","*----*","-****-","-**-*","******"]

engltr = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0",".",",",":","?","'","-","/"," "]

p eng_to_morse_time(morse,engltr)
p morse_to_eng(morse,engltr)