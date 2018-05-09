def key_pair(arr, x)
    hsh = {}
    for i in 0...arr.length
        if hsh[arr[i]]
            return 'Yes'
        else
            hsh[(x - arr[i]).abs] = i
        end    
    end 

    return 'No'   
end

arr = [1,4,45,6,10,8]
x = 16
arr = [1,2,4,3,6]
x = 10
arr = [2,5,7,9]
x = 8
arr = [1, 4, 45, 6, 10, -8]
x = 16
puts key_pair(arr, x)    