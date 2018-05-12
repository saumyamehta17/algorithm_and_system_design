def special_keyboard(n)

  return -1 if n < 0

  arr = Array.new(n, 0)
  for i in 0...6
    arr[i] = i+1
  end

  for x in 7..n

    for y in 1...(x-3)
      # x - y - 2 + 1 mean
      # x total operations
      # - y = that are no of A's will be pasted, substracted bcoz operation performed
      # - 2 = one is select and one is copy, that not help to paste
      # + 1 = that already one the screen 
      val = arr[y-1] * (x-y-2+1)
      arr[x-1] = [arr[x-1], val].max
    end
    
  end  

  puts arr.to_s
end  

n = 11
special_keyboard(n)