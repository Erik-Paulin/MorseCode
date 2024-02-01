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
morsw
  find_matching_item("banana", list)  # Output: Input matches banana
  find_matching_item("pear", list)    # Output: Input does not match any item in the list
  