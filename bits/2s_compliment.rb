def find_complement(num)
    toDecimal(toBinary(num))
end

def toBinary(num)
    s = ''
    while(num > 0)
        rem = (num % 2).to_s
        s = rem + s
        num = num / 2
    end

    s
end

def toDecimal(s)
    num = 0
    n = s.length
    for i in 0...n
        bit = s[i].to_i == 1 ? 0 : 1
        num += bit*(2**(n-i-1))
    end
    num
end

def find_complement_v2(num)
  mask = 1
  while mask < num
    mask = (mask << 1) + 1
  end
  mask ^ num
end

num = 33
# puts find_complement(num)
puts find_complement_v2(num)
