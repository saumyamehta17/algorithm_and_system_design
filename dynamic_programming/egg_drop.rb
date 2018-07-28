# recursive with overrideing subproblem

# where n  - no of eggs
# k - no of floor
INT_MAX = 4611686018427387903

def eggdrop(n,k)

  if k == 0 || k == 1
    return k
  end
  
  if n == 1
    return k
  end

  min ||= INT_MAX

  for x in 1..k
    res = [eggdrop(n-1, x-1), eggdrop(n, k-x)].max
    min = [res, min].min
  end 

  min + 1 

end  


# puts eggdrop(2,4)

# puts eggdrop(2,10)


# Using Dynamic Programming

def eggdrop_using_dp(n,k)
  mtrx = Array.new(n) {Array.new(k)}

  for i in 0...k
    mtrx[0][i] = i
  end

  for i in 0...n
    mtrx[i][0] = 1
  end

  for i in 1...n
    for j in 1...k
      mtrx[i][j] = INT_MAX  
      for x in 1..j
        res = [mtrx[i-1][x-1], mtrx[i][j-x]].max
        mtrx[i][j] = [mtrx[i][j], res].min
      end  
      mtrx[i][j] = 1 + mtrx[i][j]
    end
  end    

  puts mtrx[n-1][k-1]
end  


eggdrop_using_dp(2,36)