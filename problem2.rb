require 'pry'
no_of_testcases = 1 #gets.chomp.to_i

(1..no_of_testcases).to_a.each do |t|
	n_and_s = [4,4] #gets.chomp.split(' ')
	n = 4#n_and_s[0].to_i
	s = 4 #n_and_s[1].to_i
    arr = [1,2,3,4] #gets.chomp.split(' ').map(&:to_i)
    arr = arr.sort
    k = n - 1
    diffs = []
    while(k >= 0)
      mx = [arr[k].to_i,arr[0].to_i].max
      mn = [arr[k].to_i,arr[0].to_i].min
      binding.pry
      diff = mx.to_i*(k+1) - mn.to_i*(k+1)
      if(diff) <= s && ((diffs[0] || 0) < diff)
        diffs << k+1
        diffs << diff
      end	
      k -= 1  
    end
    puts diffs[0]
    puts diffs[1]
end	

