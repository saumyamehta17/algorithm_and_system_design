require 'pry'
def num_to_binary(num)
  arr = []
  while(num > 0)
    reminder = num % 2
    arr.push reminder
    num = num/2
  end 
  arr.reverse 
end

def negate(bits)
  i = 0
  while(i < bits.length)
    bits[i] = bits[i] == 0 ? 1 : 0
    i += 1
  end 
  bits
end  


def anding(bits,negate_bits)
  i = 0
  arr = []
  while(i < bits.length)
    arr[i] = bits[i] & negate_bits[i]
    i += 1
  end 
  arr 
end  

def binary_to_decimal(arr)
  sum = 0
  arr.reverse.each_with_index do |a,i|
    sum += 2**i if a == 1
  end   
  sum
end  

def print_right_most_bit(num)
  bits = num_to_binary(num)
  print bits
  puts "\n"
  bits_minus_one = num_to_binary(num-1)
  print bits_minus_one
  puts "\n"
  negate_bits = negate(bits_minus_one)
  print negate_bits
  puts "\n"
  final = anding(bits, negate_bits)
  print final
  puts "\n"
  right_most_bit = binary_to_decimal(final)
  puts "right most set bit --> #{right_most_bit}"
end  

# print_right_most_bit(19)
print_right_most_bit(12)
