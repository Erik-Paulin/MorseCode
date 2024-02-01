def convert(puls_dur)
    morse_lttr = ""
    puls_dur.each do |duration|
        if duration < 300
          morse_lttr += "*"
        elsif duration > 400
          morse_lttr += "-"
        else
            morse_lttr += " "
        end


    return
end