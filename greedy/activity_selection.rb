# Greedy - Global optimum can be selected by local optimum
# Optimal Structure - optimal sol to subproblems, it never reconsider its choices

def act_selection(start, finish)

  return if start.length == 0
  # sort acc to finish
  sort_by_finish(start, finish, 0, finish.length - 1)
  c = 1
  for j in 1...start.length

    if(start[j] >= finish[j-1])
      c += 1
    end
    
  end 

  puts "Total Activities are : #{c}" 

end 

def sort_by_finish(start, finish, low, hi)
  if low < hi
    pivot_indx = find_pivot_indx(start, finish, low, hi)
    sort_by_finish(start, finish, low, pivot_indx - 1)
    sort_by_finish(start, finish, pivot_indx + 1, hi)
  end
end 

def find_pivot_indx(start, finish, low, hi)
  pivot = finish[hi]
  i = j = low
  while(i < hi)
    if finish[i] < pivot
      if i != j
        swap(finish, i, j)
        swap(start, i, j)
      end  
      j += 1
    end  
    i += 1
  end

  if i != j
    swap(finish, i, j)
    swap(start, i, j)
  end 
  j 
end  

def swap(arr, i, j)
  temp = arr[i]
  arr[i] = arr[j]
  arr[j] = temp
end  

start = [10, 20, 20, 30, 40]
finish = [20, 45, 30, 40, 45]

# start = [1, 3, 0, 5, 8, 5]
# finish = [2, 4, 6, 7, 9, 9]
act_selection(start, finish)