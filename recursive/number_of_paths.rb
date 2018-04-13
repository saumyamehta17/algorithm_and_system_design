# following solution has many overlapping subproblems so time complexity is exponential
@m = 2
@n = 8
def find_paths(row, col)
  if(row == @m-1 || col == @n-1)
    return 1
  end  

  find_paths(row, col+1) + find_paths(row+1, col)  
end
puts "With overlapping subarrays"
puts find_paths(0,0)  

def find_paths_using_2darray(m,n)
  arr = Array.new(m){Array.new(n)}
  i = 0
  while (i < n)
    arr[0][i] = 1
    i += 1
  end

  i = 0
  while(i < m)
    arr[i][0] = 1
    i += 1
  end

  i = 1
  while(i < m)
    j = 1
    while(j < n)
      arr[i][j] = arr[i-1][j] + arr[i][j-1]
      j += 1
    end
    i += 1
  end

  arr[m-1][n-1]
end  
puts "solving overlapping subarrays"
puts find_paths_using_2darray(3,3)