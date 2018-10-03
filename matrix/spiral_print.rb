def spirial(mtrx, m, n)
  i = 0
  j = 0
  while(i < m && j < n)
    k = j
    while(k < n)
      print " #{mtrx[i][k]}"
      k += 1
    end
    i += 1

    k = i
    while(k < m)
      print " #{mtrx[k][n-1]}"
      k += 1
    end  

    n = n-1

    if (i >= m || j >= n)
      break
    end  
    k = n - 1

    while(k >= j)
      print " #{mtrx[m-1][k]}"
      k -= 1
    end  

    m = m-1
    k = m - 1
    while(k >= i)
      print " #{mtrx[k][j]}"
      k -= 1
    end
    j += 1
  end  
end  

# m = 4
# n = 4
# mtrx = [[1,2,3,4],
#         [5,6,7,8],
#         [9,10,11,12],
#         [13,14,15,16]
#        ]

mtrx = [
        [1, 2, 3, 4,5, 6],
        [7, 8, 9,10,11,12],
        [13,14,15,16,17,18]
       ] 
m = 3
n = 6     

spirial(mtrx, m, n)