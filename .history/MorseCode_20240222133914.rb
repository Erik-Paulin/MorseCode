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

def morse_to_engltr(engl, inmorse,list)
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
      end
  end
  return morse_lttr
end

morse =  ["*-","-***","-*-*","-**","*","**-*","--*","****","**","*---","-*-","*-**","--","-*","---","*--*","--*-","*-*","***","-","**-","***-","*--","-**-","-*--","--**","*----","**---","***--","****-","*****","-****","--***","---**","----*","-----","*-*-*-","--**--","---***","**--**","*----*","-****-","-**-*","******"]

engltr = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","1","2","3","4","5","6","7","8","9","0",".",",",":","?","'","-","/"," "]

str=[]

def morse_to_eng()
  while str[str.length-1]!="."
    h=[]
    g=0
    while g < 800
      g = gets.chomp.to_i
      if g < 800
      #if myChrono.elapsed < 800
        h.append(g)
        # h.append(myChrono.elapsed())
      else
        str << morse_to_engltr(engltr,convert(h),morse)
        p str
      end
    end

  end
  str=str.join()
  p str
end


def eng_to_morse_time(str)
  str = str.



  return time
end