def count_path(m, n)
  if m == 0 || n == 0
    return 1
  end

  return count_path(m, n-1) + count_path(m-1, n)
end  
m = 2
n = 2
puts count_path(m-1, n-1)