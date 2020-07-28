# @param {Integer[][]} a
# @return {Integer}
def shortest_bridge(a)
  m = a.length
  n = a[0].length
  i,j = find(a,m,n)
  explore(a, m, n, i, j)
end

def find(a, m, n)
  for i in 0...m
    for j in 0...n
      return [i,j] if a[i][j] == 1
    end
  end
end

def explore(a, m, n, i, j, path = 0, prev = -1)
  if a[i][j] == 1 && prev == 0
    return path
  end

  prev = a[i][j]
  path += 1 if prev == 0
  a[i][j] = 2 if prev == 1  #Mark Visited

  #top
  top = valid?(a,m,n,i-1,j) ? explore(a, m, n, i-1, j, path, prev) : Float::INFINITY
  puts "top #{top}"
  #bottom
  bot = valid?(a,m,n,i+1,j) ? explore(a, m, n, i+1, j, path, prev) : Float::INFINITY
  puts "bot #{bot}"
  #left
  left = valid?(a,m,n,i,j-1) ? explore(a, m, n, i, j-1, path, prev) : Float::INFINITY
  puts "left #{left}"
  #right
  right = valid?(a,m,n,i,j+1) ? explore(a, m, n, i, j+1, path, prev) : Float::INFINITY
  puts "right #{right}"
  puts "#{i}-#{j}  --> #{top}  #{bot}  #{left}  #{right}"
  [top, bot, left, right].min
end

def valid?(a,m,n,i,j)
  i >= 0 && j >= 0 && i < m && j < n && a[i][j] != 2
end

a = [[0,1],[1,0]]
puts shortest_bridge(a)