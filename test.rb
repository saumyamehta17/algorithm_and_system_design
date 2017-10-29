# improved
require 'pry'
def solution(a, b)
   multiplicative_count = 0
   a.length.times do |i|
     a[i] = a[i] + (b[i] / 1_000_000.0)
   end
   a = [0.5, 1.5, 2.0, 2.0, 3.0, 5.02]

   i = 0
   while(i < a.length - 1)
    j = i
    while(j < a.length - 1)
      if (a[i] * a[j+1]) >= a[i] + a[j+1]
        puts "#{i}, #{j+1}, result #{(a[i] * a[j+1])} >= #{a[i] + a[j+1]}"
        multiplicative_count += (a.length - 1 - j)
        break
      end  
      j += 1
    end 
    return if multiplicative_count > 100_00_00_000
    i += 1
   end 
   return multiplicative_count
end

a = [0, 1, 2, 3, 4, 5]
b = [500_000, 500_000, 0, 0, 0, 20_000]
puts solution(a,b)

# first try
# require 'pry'
# def solution(a, b)
#    multiplicative_count = 0
#    a.length.times do |i|
#      a[i] = a[i] + (b[i] / 1_000_000.0)
#    end
#    a = [0.5, 1.5, 2.0, 2.0, 3.0, 5.02]

#    i = 0
#    while(i < a.length - 1)
#     j = i
#     while(j < a.length - 1)
#       if (a[i] * a[j+1]) >= a[i] + a[j+1]
#         multiplicative_count += 1
#       end  
#       j += 1
#     end 
#     return if multiplicative_count > 100_00_00_000
#     i += 1
#    end 
#    return multiplicative_count
# end

# a = [0, 1, 2, 3, 4, 5]
# b = [500_000, 500_000, 0, 0, 0, 20_000]
# puts solution(a,b)