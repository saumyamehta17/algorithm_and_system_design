# with uniq set taking number as much time as they occured in input

# Time complexity
# The input of Combination Sum has no dups, but each element can be used for MORE than one time.

# The input of Combination Sum II has dups, but each element can be used ONCE.
# if each each elem can be used once then
#   first elem will have possible combination = c(n,0)
#   at 2nd index = c(n, 1)
#   considering n = length of array
#   c(n, 0) + c(n, 1) + c(n, 3).......+ c(n, n) = 2^n
# and when we found combination, push to result might take on averge k times
# then => o(k * 2^n )

def combination_sum(candidates, target)
    result = []
    combination(candidates, target, result, 0)
    result
end

def combination(candidates, target, result, indx, sum = 0, local_result = [])
    if sum == target
        result << local_result
        return
    end

    for i in indx...candidates.length
        elem = candidates[i]
        sum += elem
        if sum <= target
            combination(candidates, target, result, i, sum, local_result+[elem])
        end

        sum -= elem
    end
end


arr = [1,1,2,4,5,7,10]
# arr = [2,2,4]
arr = [2,4,6,8]
sum = 8
combinational_sum(arr, sum)
