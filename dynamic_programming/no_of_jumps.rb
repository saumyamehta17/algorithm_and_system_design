def num_of_jumps(arr, n)
  jump_arr = Array.new(n)
  path_arr = Array.new(n)
  jump_arr[0] = 0
  path_arr[0] = 0

  for i in 1...n
    for j in 0...i

      if( (i-j) <= arr[j])

        if jump_arr[i].nil?
          jump_arr[i] = jump_arr[j] + 1
          path_arr[i] = j
        else
          if (jump_arr[j] + 1) < jump_arr[i]
            jump_arr[i] = jump_arr[j] + 1
            path_arr[i] = j
          end  
        end  

      end  
    end
  end


  puts jump_arr[n-1]    
end  

arr = [1, 3, 6, 3, 2, 3, 6, 8, 9, 5]
arr = [1, 3, 6, 1, 0, 9]
n = arr.length
num_of_jumps(arr, n)