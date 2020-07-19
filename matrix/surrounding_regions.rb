def solve(board)
  m = board.length
  return if m == 0
  n = board[0].length
  puts n
  for i in 0...m
    for j in 0..n
      board[i][j] = '-' if board[i][j] == 'O'
    end
  end

  q = Queue.new
  for i in 0...n
    q.enq([0,i]) if board[0][i] == '-'
    q.enq([m-1,i]) if board[m-1][i] == '-'
  end

  for i in 0...m
    q.enq([i,0]) if board[i][0] == '-'
    q.enq([i,n-1]) if board[i][n-1] == '-'
  end

  while(not q.empty?)
    elem = q.deq
    i,j = elem
    board[i][j] = 'O'

    q.enq([i+1, j]) if valid?(board, i+1, j, m, n)
    q.enq([i-1, j]) if valid?(board, i-1, j, m, n)
    q.enq([i, j+1]) if valid?(board, i, j+1, m, n)
    q.enq([i, j-1]) if valid?(board, i, j-1, m, n)
  end

  for i in 0...m
    for j in 0..n
      board[i][j] = 'X' if board[i][j] == '-'
    end
  end

  puts board.to_s
end

def valid?(board, i, j, m, n)
  i >= 0 && j >= 0 && i < m && i < n && board[i][j] == '-'
end

board = [
    ['X', 'X', 'X'],
    ['X', 'O', 'X'],
    ['0', 'O', 'X'],
    ['X', 'X', 'X'],
]

board = [[]]
board = [["X","O","X","O","X","O"],["O","X","O","X","O","X"],["X","O","X","O","X","O"],["O","X","O","X","O","X"]]
solve(board)