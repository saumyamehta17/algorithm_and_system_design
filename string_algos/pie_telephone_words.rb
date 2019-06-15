# Print all possible strings for a given telephone number
# Time complexity is 3^1+3^2+3^3......3^n = o(3^n)

def printNumbers(currIndex = 0)
  if currIndex == @len
    @count += 1
    puts @result.to_s
    return
  end

  for place in 1..3
    char = getChar(@telephoneNumber[currIndex], place)
    @result[currIndex] = char
    printNumbers(currIndex+1)
  end  
end

def getChar(num, place)
  @telephoneWords[num][place]
end  
@count = 0
@telephoneNumber = [3,9,7]
@len = @telephoneNumber.length
@result = Array.new(@len)
@telephoneWords = {
  2 => {1 => 'A', 2 => 'B', 3 => 'C'},
  3 => {1 => 'D', 2 => 'E', 3 => 'F'},
  4 => {1 => 'G', 2 => 'H', 3 => 'I'},
  5 => {1 => 'J', 2 => 'K', 3 => 'L'},
  6 => {1 => 'M', 2 => 'N', 3 => 'O'},
  7 => {1 => 'P', 2 => 'R', 3 => 'S'},
  8 => {1 => 'T', 2 => 'U', 3 => 'V'},
  9 => {1 => 'W', 2 => 'X', 3 => 'Y'},
}

printNumbers
puts @count