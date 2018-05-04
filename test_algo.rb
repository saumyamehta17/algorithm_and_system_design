Sample = Struct.new(:buy, :sell)
def stock_buy_sell(arr)
  n = arr.length
  c = 0
  i = 0
  counter = []
  while(i < n-1)

    while(i < n-1 && arr[i] >= arr[i+1])
      i += 1
    end
    if(i == n-1)
      break
    end  
    counter[c] = Sample.new(i)
    i += 1
    while(i < n && arr[i] > arr[i-1])
      i += 1
    end

    counter[c].sell = i-1

    c += 1  
  end 

  puts counter.to_s
end

arr = [100, 180, 260, 310, 40, 30]
stock_buy_sell(arr)  