def int_to_roman(num)
    roman_number = ""
    bar = setbar(num)
    
    while(num > 0)
      digit = num / bar
      roman_number += calculate(digit, bar)
      num = num % bar
      bar = bar / 10
    end
    
    roman_number
end

def setbar(num)
    if num < 10
        1
    elsif num < 100
        10
    elsif num < 1000
        100
    else
        1000
    end
end

HSH = {
    1 => 'I', 5 => 'V', 10 => 'X', 50 => 'L', 100 => 'C', 500 => 'D', 1000 => 'M'
}
def calculate(digit, bar)
    num = bar * digit
    if HSH[num]
        HSH[num]
    elsif (1..3) === digit
      HSH[bar] * digit
    elsif digit == 4
      HSH[bar*5 - bar*digit] + HSH[bar*5]
    elsif (6..8) === digit
      HSH[bar*5] + HSH[bar]*(digit-5)
    elsif digit == 9
      HSH[bar*10 - (bar*digit)]+HSH[bar*10]
    else 
      ''  
    end
end

num = 101
puts int_to_roman(num)