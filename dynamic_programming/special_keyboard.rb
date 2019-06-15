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
      # - y = that are no of A's that will be pasted, substracted bcoz operation already performed
      # - 2 = one is select and one is copy, that will not help to paste
      # + 1 = that already on the screen 
      ## for example: y=2, x=7
      # 7 places A_ A_ select_ copy_ paste_ paste_ paste_
      # first 2 places = 2 operation perfomed = -2, and 
      #   pasted = + 1
      # select and copy = 2 operation performed = -2
      # rest are = 7 - 2 + 1 - 2 = 4, total 4 ctrl V can be used

      val = arr[y-1] * (x-y-2+1)
      arr[x-1] = [arr[x-1], val].max
    end
    
  end  

  puts arr.to_s
end  

n = 11
special_keyboard(n)