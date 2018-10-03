
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

puts Benchmark.measure { fib_ite(4) }
puts Benchmark.measure { puts fib_rec(4) }