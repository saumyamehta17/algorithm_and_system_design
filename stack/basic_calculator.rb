# Problem: https://leetcode.com/problems/basic-calculator/

def calculate(s)
  values = []; operators = []; i = 0

  while(i < s.length)
    chr = s[i]
    if chr == ' '
      i += 1
      next
    end

    if is_digit(chr)
      operand = 0
      while(i < s.length && is_digit(s[i]) && s[i] != ' ')
        operand *= 10
        operand += s[i].ord - '0'.ord
        i += 1
      end
      values.push(operand)
      i -= 1
    elsif chr == '('
    elsif chr == ')'
    else
      if !operators.empty? && operators.last != '('
        apply(values.pop, operators.pop, values.pop)
      end
      operators.push(chr)
    end
    i += 1
  end

  while(!operators.empty?)
    val = apply(values.pop, operators.pop, values.pop)
    values.push(val)
  end
  values.pop || 0
end

def precedence(opr1, opr2)
  return true if (opr1 == '+' && opr2 == '-')  || (opr1 == '-' && opr2 == '+')
end

def apply(val1, op, val2)
  if op == '-'
    return val2 - val1
  elsif op == '+'
    return val2 + val1
  end
end

def is_digit(chr)
  digit = chr.ord - '0'.ord
  (0..9).include?(digit)
end

# test_cases = ["1 + 1" , " 2-1 + 2 ", "   " , "0" ,"()" , "(1+(4+5+2)-3)+(6+8)", "(1+2)-1", "123 4 ", " 214748364 7 "]
test_cases = ["1 + 1" , " 2-1 + 2 ", "   ", "214748364"]
test_cases.each do |tc|
  puts calculate(tc)
end
