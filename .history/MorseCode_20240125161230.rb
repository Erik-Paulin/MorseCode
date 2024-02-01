def decodeltr()
    decodeltr = letters.find do |item|input == item
      
    end
    

    return decodeltr
end

def find_matching_item_and_index(input, list)
    match_index = nil
  
    list.each_with_index do |item, index|
      if input == item
        puts "Input matches #{item} at index #{index}"
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

def morse

Morse = [*-,-***,-*-*,-**,*,**-*,--*,****,**,*---,-*-,*-**,--,-*,---,*--*,--*-,*-*,***,-,**-,***-,*--,-**-,-*--,--**,*----,**---,***--,****-,*****,-****,--***,---**,----*,-----,*-*-*-,--**--,---***,**--**,*----*,-****-,-**-*,-*--*-,*-**-*]

ENGltr = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
,"1","2","3","4","5","6","7","8","9","0","Period","Comma","Colon","Question Mark","Apostrophe","Hyphen","Fraction Bar","Parentheses","Quotation"]

find_matching_item("banana", list)  # Output: Input matches banana
find_matching_item("pear", list)    # Output: Input does not match any item in the list
  