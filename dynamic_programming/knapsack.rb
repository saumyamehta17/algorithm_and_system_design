def k(n,w)

  if(n == 0 || w == 0)
    return 0
  end

  if(@weight[n-1] > w)
    return k(n-1, w)
  end  

  return [@val[n-1] + k(n-1, w - @weight[n-1]),
          k(n-1, w)].max  
end  




# Dynamic Programing to solve above overlapping problem
def k_using_dp(n, w)

  val_matrix = Array.new(n){Array.new(w+1)}

  # for weight 0
  for i in 0...n
    val_matrix[i][0] = 0
  end

  for i in 0..w 
    if(i >= @weight[0])
      val_matrix[0][i] = @val[0]
    else
      val_matrix[0][i] = 0
    end
  end  
  
  for i in 1...n
    for j in 1..w
      if(j >= @weight[i])
        val_matrix[i][j] = [@val[i] + val_matrix[i-1][j-@weight[i]],
        val_matrix[i-1][j]].max
      else
        val_matrix[i][j] = val_matrix[i-1][j]
      end  
    end
  end   

  puts val_matrix.to_s
  puts val_matrix[n-1][w] 
end  



# @val = [10, 20, 30]
# @weight = [1, 1, 1]
# w = 2

@val = [60, 100, 120]
# @weight = [10, 20, 30]
# w = 50

@val = [70, 20, 10]
@weight = [5,4,9]
w = 9

@val = [1,2,3]
@weight = [4,5,1]
w = 4
puts k(@val.length, w)
# k_using_dp(@val.length, w)