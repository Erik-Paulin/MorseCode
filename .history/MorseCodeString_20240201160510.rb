def convert(puls_dur)
    morse_lttr = ""
    puls_dur.each do |duration|
        if duration < 400
          morse_lttr += "*"
        elsif duration > 400 && duration < 800
          morse_lttr += "-"
        else
            morse_lttr += " "
        end
    end
    return morse_lttr
end

# reg glob var för loop 