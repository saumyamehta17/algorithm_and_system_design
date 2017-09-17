def tower_of_hanoi(n, beg_peg, end_peg, aux)
  if n == 1
    puts "move disk from #{beg_peg} to #{end_peg}"
    return
  else
    tower_of_hanoi(n-1, beg_peg, aux, end_peg)
    puts "move disk from #{beg_peg} to #{end_peg}"
    tower_of_hanoi(n-1, aux, end_peg, beg_peg)
  end  
end  

def hanoi(n)
  puts "starting....."
  tower_of_hanoi(n, 'A', 'C', 'B')
end  

hanoi(3)