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

h=[]
if myChrono.elapsed < 800
h.append(myChrono.elapsed())
else
str.append(" ")
convert(h)
end

