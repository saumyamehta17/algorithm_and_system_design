#Given n, how many structurally unique BST's (binary search trees) that store values 1 ... n?

# Memoize values
def num_trees(n)
  arr = Array.new(n+1,1)

  for i in 2..n
    for j in 0...i
      arr[i] += (arr[j] * arr[i-j-1])
    end
  end
  arr[n]
end

n = 5
# puts num_trees(n)

# overlapping sub problem
def num_trees_with_overlapping(n)
  return n if n <= 2
  bst_count(1,n)
end


def bst_count(s, e)
  if s <= 0 || s >= e
    return 1
  end
  c = 0
  for i in s..e
      left = bst_count(s, i-1)
      right = bst_count(i+1, e)
      puts (s..e).to_s
      c += (left*right)
  end
  c
end
n = 3
puts num_trees_with_overlapping(n)