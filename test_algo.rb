def eD(n, k)

  if k == 1 || k == 0
    return k
  end

  if n == 1
    return k
  end

  min ||= 300000

  for x in 1..k
    val = [eD(n-1, x-1), eD(n, k-x)].max
    min = [val, min].min
  end
  min + 1 
end  

n = 2
k = 10
puts eD(n, k)