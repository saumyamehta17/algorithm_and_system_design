def jump_over_numbers(list)
  index = 1
  count = 0
  length = list.size
  
  while(index <= length)
    return -1 if list[index-1] == 0
    index = index + list[index-1].to_i
    puts index
    count += 1
  end
  
  return count
    
  # Write your solution here
end

puts jump_over_numbers(%w{3 4 1 2 5 6 9 0 1 2 3 1})
