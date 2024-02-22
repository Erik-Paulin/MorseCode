def convert(puls_dur)
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

# reg glob(date unix timestamp) var för loop när high och en annan när high > low gämnför --> pulslängd 

h=[200,500,200]
h.append(myChrono.elapsed())
p convert(h)