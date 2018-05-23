def multiple_of_3(num)
  odd_count = 0
  even_count = 0

  while(num != 0)

    if num & 1 != 0
      odd_count += 1
    end
    num >> 1

    if num & 1 != 0
      even_count += 1
    end
    
    num >> 1  
  end

  if (odd_count - even_count).abs  == 0
    return "YES"
  end 

  return "NO" 
end  

num = 12
multiple_of_3(num)