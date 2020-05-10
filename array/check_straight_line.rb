# Find Slope in x and y axis
# Diff b\w two coordinates x's and y's give us slope of line
# if all other further points have same rate of change with respect to first two coordinates then its a striaght line

# (y1-y0)    (y2-y1)
# ------- == -------
# (x1-x0)    (x2-x1)
#
# which mean (y1-y0) * (x2-x1) == (y2-y1) * (x1-x0) OR diffY * (x2-x1) == diffX * (y2-y1)
# Ref: https://www.youtube.com/watch?v=f2n9NOkqvZQ

def check_straight_line(coordinates)
  n = coordinates.length
  return true if n == 2

  x = coordinates[0][0]
  y = coordinates[0][1]
  x1 = coordinates[1][0]
  y1 = coordinates[1][1]
  dy = y1-y; dx = x1-x

  for i in 2...n
      x = coordinates[i][0]
      y = coordinates[i][1]

      if (y-y1)*dx != (x-x1)*dy
          return false
      end
  end
  return true
end

# Input: coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
# Output: false

# Input: coordinates = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
# Output: true

