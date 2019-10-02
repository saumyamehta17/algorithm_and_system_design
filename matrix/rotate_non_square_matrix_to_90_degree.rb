# takes extra space
def rotate(mtrx, r, c)
  puts mtrx.to_s

  output = Array.new(c) { Array.new(r) }
  for i in 0...r
    for j in 0...c
      output[j][r-i-1] = mtrx[i][j]
    end
  end   

  puts output.to_s 
end

mtrx = [[1,2,3], [4,5,6], [7,8,9]]  
mtrx = [[1,2,3,0], [4,5,6,0], [7,8,9,0]]  
r = 3
c = 4
rotate(mtrx, r, c)