# A positive integer N is given. The goal is to construct the shortest possible 
# sequence of integers ending with N 


def find_shortest_seq(n)
  new_num = n/2
  i = 0
  arr = []; arr[i] = 1

  while(arr[i] < new_num)
    n1 = arr[i] * 2
    n2 = arr[i] + 1

    i += 1
    if(n1 < new_num)
      arr[i] = n1
    else
      arr[i] = n2
    end  
  end
  puts arr.to_s
  if(arr[i] == n)
    puts arr.to_s
    puts i 
  elsif n == (arr[i] * 2)
    arr[i + 1] = arr[i] * 2
    puts arr.to_s
    puts i + 1
  else
    arr[i + 1] = arr[i] * 2
    i += 1
    arr[i + 1] = arr[i] + 1
    puts arr.to_s
    puts i
  end 
  
end  
n = 23
find_shortest_seq(n)