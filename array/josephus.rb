# n are thieves standing in circle, k is kth thief will be killed by jailer
# we need to find out position where I can be safe

def josephus(n, k)
  if(n == 1)
    return 1
  end

  (josephus(n-1, k) + k-1) % n + 1
end  

n = 5
k = 3
puts josephus(n,k)  