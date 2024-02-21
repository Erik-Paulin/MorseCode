def index(input, list)
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

def MorseToEngLtr(engl, inmorse,list)
index = index(inmorse, list)
lttr = engl.dup[index]
return lttr
end

def convert(lttr)
  morse_lttr = ""
  lttr.each do |duration|
      if duration < 300
        morse_lttr += "*"
      elsif duration > 300 && duration < 800
        morse_lttr += "-"
      else
          morse_lttr += " "
      end
  end
  return morse_lttr
end


morse =  ["*-","-***","-*-*","-**","*","**-*","--*","****","**","*---","-*-","*-**","--","-*","---","*--*","--*-","*-*","***","-","**-","***-","*--","-**-","-*--","--**","*----","**---","***--","****-","*****","-****","--***","---**","----*","-----","*-*-*-","--**--","---***","**--**","*----*","-****-","-**-*","-*--*-","*-**-*"]

engltr = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0","Period","Comma","Colon","Question Mark","Apostrophe","Hyphen","Fraction Bar","Parentheses","Quotation"]

while
h=[]
if myChrono.elapsed < 800
  h.append(g)
  # h.append(myChrono.elapsed())
else
  str.append(" ")
  convert(h)
end

str.append(morse_to_engltr(engltr,convert(h),morse))

p str
