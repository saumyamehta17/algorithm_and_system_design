# DFA - deterministic finit automata

# for a particular input character, machine goes to one state only.

# have 5 tuples

# Q - total no of states
# q0 - initia state
# sigma - set of symbols/input
# F - set of final states
# delta - transition func
# divisble by n , take n states for ex if n = 4 then states are 0,1,2,3
# https://www.youtube.com/watch?v=UdhgFvVMPpE

def multiple_of_3(input)
  state = 0
  for i in 0...input.length
    val = input[i].to_i
    case state
      when 0
        if val == 1
          state = 1
        end
      when 1
        if val == 1
          state = 0
        else
          state = 2
        end
      when 2
        if val == 0
          state = 1
        end
    end  
  end
  state == 0
end

# input = '1100'
input = '1010'
input = '10101'
puts "input is multiple of 3: #{multiple_of_3(input)}"