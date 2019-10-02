def rotate(mtrx, n)
  puts "Before Rotation"
  puts mtrx.to_s
  # no of floor in mtrx - n/2
  for x in 0...(n/2)
    for y in x...(n-x-1)
      # save top
      tmp = mtrx[x][y]
      # right to top
      mtrx[x][y] = mtrx[y][n-x-1]
      # bottom to right
      mtrx[y][n-x-1] = mtrx[n-x-1][n-y-1]
      # left to bottom
      mtrx[n-x-1][n-y-1] = mtrx[n-y-1][x]
      # top to left
      mtrx[n-y-1][x] = tmp
    end
  end
  puts "After Rotation"
  puts mtrx.to_s    
end  
mtrx = [
  [1,2,3,4],
  [5,6,7,8],
  [9,10,11,12],
  [13,14,15,16]
  ]
n = 4
rotate(mtrx, n)