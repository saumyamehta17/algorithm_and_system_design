require 'set'
s = Set.new
def factors(n, s)
  for i in 2..n
    if n % i == 0
      s.add(i)
      factors(n/i, s)
    end
  end
end

n = 35
factors(n, s)
puts s