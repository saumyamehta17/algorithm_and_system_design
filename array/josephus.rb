# n are thieves standing in circle, k is kth thief will be killed by jailer
# we need to find out position where I can be safe

# if n = 5, if one person killed then we have 4 people and we have skipped k people, 
# as its a circle then we have module with n
def josephus(n,k)
  if(n == 1)
    return 0
  end

  (josephus(n-1, k) + k) % n
end  

puts josephus(7,3)