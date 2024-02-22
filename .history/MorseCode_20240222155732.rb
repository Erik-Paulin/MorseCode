def index(input, list)
  match_index = nil
  list.each_with_index do |item, index|
    if input == item
      match_index = index
      break  # Stop searching once a match is found
    end
  end
  if match_index.nil?
    puts "Input does not match any item in the list (morse )"
  end
  return match_index
end 
# Example usage

def morse_to_engltr(engl, inmorse,list)
  index = index(inmorse, list)
  p index
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


def morse_to_eng(morse,engltr)
  str=[]
  while str[str.length-1]!="."
    h=[]
    g=0
    while g < 800
      g = gets.chomp.to_i
      if g < 800
      #if myChrono.elapsed < 800
        h << g
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
  p wrd
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
  p ineng
  while i<ineng.length
    index = index!(ineng[i], engltr)
    p index
    lttr << morse.dup[index]
    i+=1
  end
  p lttr
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

#p eng_to_morse_time(morse,engltr)
p morse_to_eng(morse,engltr)