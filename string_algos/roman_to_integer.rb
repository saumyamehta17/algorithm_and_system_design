ROMAN_INPUT = {
  'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1000
}
def roman_to_int(input)
  n = input.length
  i = n-2
  val = ROMAN_INPUT[input[n-1]]
  while(i >= 0)
    if(ROMAN_INPUT[input[i]] < ROMAN_INPUT[input[i+1]])
      val -= ROMAN_INPUT[input[i]]
    else
      val += ROMAN_INPUT[input[i]]
    end
    i -= 1  
  end

  puts val  
end  

input = "MCMIV"
input = "III"
roman_to_int(input)