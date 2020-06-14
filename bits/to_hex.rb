BASE = [
  '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
  'a', 'b', 'c', 'd', 'e', 'f'
]
require 'pry'
def to_hex(num)
  return '0' if num == 0

  negative = num < 0 ? true : false
  num = num.abs
  # num = num < 0 ? ((2**8)+num) : num
  s = []

  while num > 0
    r = num % 16  # &
    s.unshift(BASE[r])
    num /= 16 # >> 4
  end

  negative ? convert_to_negative(s).join : s.join
end

# another way to convert to negative
def convert_to_negative(num)
  # add zeroes
  # binding.pry
  num = (['0'] * (8 - num.size)).concat(num)
  # flip
  num.map! { |x| BASE[15 - BASE.index(x)] }
  # add '1'
  n = 0
  i = num.size - 1
  while i >= 0
    n, r = (BASE.index(num[i]) + 1).divmod(16)

    num[i] = BASE[r]
    break if n == 0

    i -= 1
  end

  num
end

num = -10
puts to_hex(num)