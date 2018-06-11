def act_selection(start, finish)

  return if start.length == 0
  # sort acc to finish

  i = 0
  c = 1
  for j in 1...start.length

    if(start[j] >= finish[i])
      c += 1
      i = j  
    end
    
  end 

  puts "Total Activities are : #{c}" 

end  

start = [10, 12, 20]
finish = [20, 25, 30]

start = [1, 3, 0, 5, 8, 5]
finish = [2, 4, 6, 7, 9, 9]
act_selection(start, finish)