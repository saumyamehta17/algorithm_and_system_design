
def fib_ite(n)
  a = 0
  b = 1
  i = 1 
  while(i < n)
    s = a + b 
    a = b
    b = s
    i += 1
  end
  puts s
end



def fib_rec(n)
  if n == 0 || n == 1
    return n
  end
  fib_rec(n-1) + fib_rec(n-2)
end
fib_ite(4)
fib_rec(4)
# puts Benchmark.measure { fib_ite(4) }
# puts Benchmark.measure { puts fib_rec(4) }


def fib_with_tail_recursion(n, a = 0, b = 1)
  if n == 0
    return a
  end

  if n == 1
    return b
  end

  fib_with_tail_recursion(n-1, b, a+b)  
end  
puts fib_with_tail_recursion(4)
puts fib_with_tail_recursion(5)
puts fib_with_tail_recursion(9)