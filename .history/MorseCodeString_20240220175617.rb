def convert(ltt)
    morse_lttr = ""
    puls_dur.each do |duration|
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

h=[200,500,200]
# h.append(myChrono.elapsed())
p convert(h)