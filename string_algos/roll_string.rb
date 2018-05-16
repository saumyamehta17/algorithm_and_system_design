def roll_string(to_roll, rolls)
  to_roll_len = to_roll.length

  roll_counts = Array.new(to_roll_len, 0)

  rolls.each do |r|
    roll_counts[r-1] += 1
  end

  indx = to_roll_len - 2
  while(indx >= 0)
    roll_counts[indx] += roll_counts[indx+1]
    indx -= 1
  end

  to_roll_len.times do |i|
    puts ('a'.ord + (roll_counts[i] + to_roll[i].ord - 'a'.ord) % 26)
    to_roll[i] = ('a'.ord + (roll_counts[i] + to_roll[i].ord - 'a'.ord) % 26).chr
  end

  puts to_roll  
end  

to_roll = 'abc'
to_roll = 'abz'
rolls = [3,2]
roll_string(to_roll, rolls)