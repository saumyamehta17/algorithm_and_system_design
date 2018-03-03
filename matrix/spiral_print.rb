def spiral_print(arr, m , n)
  k = 0 #for row
  l = 0 #for column
  while(k < m && l < n)

    i = l
    while( i < n)
      print arr[k][i].to_s + " "
      i += 1
    end
    k += 1

    i = k
    while(i < m)
      print arr[i][n-1].to_s + " "
      i += 1
    end
    n -= 1

    if(k < m)
      i = n-1
      while(i >= l)
        print arr[m-1][i].to_s + " "
        i -= 1
      end
    end  
    m -= 1

    if(l < n)
      i = m-1
      while(i >= k)
        print arr[i][l].to_s + " "
        i -= 1
      end
    end
    l += 1
  end    
end

arr = [ 
        [1,  2,  3,  4,  5,  6],
        [7,  8,  9,  10, 11, 12],
        [13, 14, 15, 16, 17, 18]
      ]

m = 3
n = 6      
spiral_print(arr, m , n)  