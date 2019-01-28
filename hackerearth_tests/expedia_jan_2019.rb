def test
  size  = gets.chomp.to_i
  arr = gets.chomp
  k = gets.chomp.to_i
  if size < 10e5
    arr = arr.split(' ')
    difficuly_level = arr[0].to_i * k
    output = 1
    for i in 1...size
      if arr[i].to_i == difficuly_level
        difficuly_level = difficuly_level * k
        output += 1
      end  
    end  

    puts output
  else
    puts 0  
  end  
end  


def lis(arr)
  arr = arr
  k = 3
  len = 5
  lis = Array.new(len, 1)
  max = 1
  for i in 1...len
    for j in 0..i
      if arr[i].to_i >= arr[j].to_i * k
        lis[i] = [lis[i], (lis[j] + 1)].max
        max = [lis[i],max].max
      end  
    end
  end    

  puts max
end  

arr = [3, 10, 2, 1, 20]
arr = [3,4, -1,0,6,2,3]
arr = [2,9,4,6,18]
# lis(arr)



def count_solution
  s = gets.chomp.to_i
  output = 0
  min = 0
  max = 10e3

  (0..s).to_a.repeated_permutation(4).to_a.each do |values|
    a = values[0]
    b = values[1]
    c = values[2]
    d = values[3]
    if (min..max) === [a,b,c,d].max

      sum = a + (b * b) + (c * c * c) + (d * d * d * d)
      if sum <= s
        puts values.to_s
        output += 1
      end  
    end  
  end

  print output  

end  

count_solution
# test