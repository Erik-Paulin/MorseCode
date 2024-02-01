def decodeltr()
    decodeltr = letters.find do |item|input == item
      
    end
    

    return decodeltr
end

def find_matching_item(input, list)
    match = list.find { |item| input == item }
  
    if match
      puts "Input matches #{match}"
      return match
    else
      puts "Input does not match any item in the list"
      return nil
    end
end
# Example usage
Morse = [*-,-***,-*-*,-**,*,**-*,--*,****,**,*---,-*-,*-**,--,-*,---,*--*,--*-,*-*,***,-,**-,***-,*--,-**-,-*--,--**,*----,**---,***--,****-,*****,-****,--***,---**,----*,-----,*-*-*-,--**--,---***,**--**,*----*,-****-,-**-*,-*--*-,*-**-*]
ENGltr = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
,"1","2","3","4","5","6","7","8","9","0","Period","Comma","Colon","Question Mark","Apostrophe","Hyphen","Fraction Bar","Parentheses","Quotation"]

find_matching_item("banana", list)  # Output: Input matches banana
find_matching_item("pear", list)    # Output: Input does not match any item in the list
  