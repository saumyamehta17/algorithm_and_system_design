# a = [7, 10, 7]
# b = [2,3,4]
# c = [2,7,4]


# len = a.length
# res = []
# for i in 0...len
#   if a[i] + b[i] > c[i] && a[i] + c[i] > b[i] && b[i] + c[i] > a[i]
#     res << "YES"
#   else
#     res << "No"
#   end  
# end  


# puts res.to_s


operations = ['push', 'push', 'push', 'pop']
x = [1,2,3,1]
arr = []
product = []
min = x[0]
max = x[0]
product << (min * max)
arr << x[0]
for i in 1...x.length

  if operations[i] == 'push'
    if x[i] > max
      max = x[i]
    end  

    if x[i] < min
      min = x[i]
    end  

    arr << x[i]
  else
    len = arr.length
    arr[0] = arr[len - 1]
    arr.pop
    arr.sort
    min = arr[0]
    max = arr[len - 2]
  end 
  
  product << min * max
end  
puts product.to_s