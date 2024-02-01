def decodeltr()
    decodeltr = letters.find do |item|input == item
      
    end
    

    return decodeltr
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

def MorseToEngLtr ()

    return
end

Morse=  [01,1000,1010,100,0,0010,110,0000,00,0111,101,0100,11,10,111,0110,1101,010,000,1,001,0001,011,1001,1011,1100,01111,00111,00011,00001,00000,10000,11000,11100,11110,11111,010101,110011,111000,001100,011110,100001,10010,101101,010010]

ENGltr = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0","Period","Comma","Colon","Question Mark","Apostrophe","Hyphen","Fraction Bar","Parentheses","Quotation"]

p item_and_index("A", ENGltr)


  