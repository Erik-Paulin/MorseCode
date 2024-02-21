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
  
end

p convert(h)