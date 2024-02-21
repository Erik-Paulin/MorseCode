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

h=[100,200,300]
if myChrono.elapsed < 800
  h.append(myChrono.elapsed())
else
  str.append()
  convert(h)
end
