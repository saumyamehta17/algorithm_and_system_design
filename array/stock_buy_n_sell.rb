buy = sell = i = 0
arr = [100, 180, 260, 20, 10, 5]
# arr = [100, 180, 260, 310, 40, 300, 20, 30]
len = arr.length

while( i < len - 1)
  if(arr[i] < arr[i+1])
    sell = i + 1
  else
    if (sell - buy) > 0
      puts "buy at #{buy}"
      puts "sell at #{sell}"
    end
    buy = sell = i + 1  
  end
  i = i + 1  
end

if (sell - buy) > 0
  puts "buy at #{buy}"
  puts "sell at #{sell}"
end
