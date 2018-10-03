

# MAX_VALUE = 4611
# def sp(pos_x, pos_y, x, y, mtrx, m, n)
#   if not_valid?(pos_x, pos_y, x, y, mtrx, m, n)
#     return MAX_VALUE
#   end

#   if pos_x == x && pos_y == y
#     return 0
#   end

#   if nothing_valid?(pos_x, pos_y, x, y, mtrx, m, n)
#     return -1
#   else
#     return [#sp(pos_x-1, pos_y, x, y, mtrx, m, n) + 1,
#     sp(pos_x+1, pos_y, x, y, mtrx, m, n) + 1,
#     #sp(pos_x, pos_y-1, x, y, mtrx, m, n) + 1,
#     sp(pos_x, pos_y+1, x, y, mtrx, m, n) + 1].min
#   end
# end

# def not_valid?(pos_x, pos_y, x, y, mtrx, m, n)
#   pos_x < 0 || pos_y < 0 || pos_x >= m || pos_y >= n || mtrx[pos_x][pos_y] == 0
# end  

# def nothing_valid?(pos_x, pos_y, x, y, mtrx, m, n)
#   not_valid?(pos_x-1, pos_y, x, y, mtrx, m, n) &&
#   not_valid?(pos_x+1, pos_y, x, y, mtrx, m, n) &&
#   not_valid?(pos_x, pos_y-1, x, y, mtrx, m, n) &&
#   not_valid?(pos_x, pos_y+1, x, y, mtrx, m, n)
# end

# pos_x = 0  
# pos_y = 0
# x = 2
# y = 3
# m = 3
# n = 4
# mtrx = [[1,0,0,0], [1,1,0,1], [0,1,1,1]]
# puts sp(pos_x, pos_y, x, y, mtrx, m, n)


