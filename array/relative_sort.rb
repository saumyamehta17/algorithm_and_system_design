# using hasing...
def relative_sort(a1, a2)
  hsh = {}
  a1.each do |a|
    hsh[a] = hsh[a] ? hsh[a] + 1 : 1
  end  

  k = 0
  a2.each do |a|
    if(hsh[a])
      i = 0
      while(i < hsh[a])
        a1[k] = a
        i += 1; k += 1
      end
      hsh.delete(a)  
    end  
  end

  hsh.keys.sort.each do |key|
    i = 0
    while(i < hsh[key])
      a1[k] = key
      i += 1; k += 1
    end  
  end

  puts "After Relative Sorting.."
  puts a1.to_s  
end  
a1 = [2, 1, 2, 5, 7, 1, 9, 3, 6, 8, 8]
a2 = [2, 1, 8, 3]
puts "Before Sorting..."
puts a1.to_s
relative_sort(a1, a2)