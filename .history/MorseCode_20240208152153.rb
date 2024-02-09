puls

while puls < 1000
    MorseToEngLtr(ENGltr, item_and_index(convert(puls), Morse))
end


def item_and_index(input, list)
    match_index = nil
  
    list.each_with_index do |item, index|
      if input == item
        match_index = index
        break  # Stop searching once a match is found
      end
    end
  
    if match_index.nil?
      puts "Input does not match any item in the list"
    end
  
    return match_index
end 
# Example usage

def MorseToEngLtr (ENGltr, item_and_index(inmorse, Morse))
    lttr = ENGltr.dup[index]
    return lttr
end

def convert(puls_dur)
    morse_lttr = ""
    puls_dur.each do |duration|
        if duration < 400
          morse_lttr += "*"
        elsif duration > 400 && duration < 800
          morse_lttr += "-"
        else
            morse_lttr += " "
        end
    end
    return morse_lttr
end
 
