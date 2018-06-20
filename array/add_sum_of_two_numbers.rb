def add_numbers(num1, num2)
  n1 = num1.length
  n2 = num2.length
  if n1 >= n2
    sum_util(num1, num2, n1-1, n2-1)
  else
    sum_util(num2, num1, n2-1, n1-1)
  end  
end  

def sum_util(num1, num2, n1, n2)
  sum = Array.new(n1, 0)
  carry = 0

  while(n2 >= 0)
    _addition = num1[n1] + num2[n2] + carry
    sum[n1] = _addition % 10
    carry = _addition / 10
    n1 -= 1
    n2 -= 1
  end  

  while(n1 >= 0)
    _addition = num1[n1] + carry
    sum[n1] = _addition % 10
    carry = _addition / 10
    n1 -= 1
  end
  ans = 0
  if carry > 0
    ans = 10
  end

  sum.each do |s|
    ans += s
    ans *= 10
  end

  puts ans/10  
end  


num1 = [2,3,4]
num2 = [1]
num1 = [2, 2, 7, 5, 3, 3, 7, 3, 3, 6, 8, 3, 0, 5, 0, 6]
num2 = [4,3,3,8]
add_numbers(num1, num2)