# Choose K Problem
require 'pry'
no_of_testcases = 1 #gets.chomp.to_i

(1..no_of_testcases).to_a.each do
	n_and_s = [4,4] #gets.chomp.split(' ')
	n = 4#n_and_s[0].to_i
	s = 4 #n_and_s[1].to_i
  arr = [1,2,3,4] #gets.chomp.split(' ').map(&:to_i)
  arr = arr.sort
  k = n - 1

  while(k >= 0)
    diff = arr[k].to_i*(k+1) - arr[0].to_i*(k+1)
    if (diff <= s)
      puts diff
      puts k + 1
      break
    end	
    k -= 1  
  end

end	

