# def triangle(a, b, c)
    
#     if(a < 0 || b < 0 || c < 0)
#         return 0
#     end    
    
#     if(a == b && a == c)
#       return 1
#     end  

#     max = [a,b,c].max
#     rest1, rest2 = [a,b,c] - [max]
    
#     res1 = max < (rest1 + rest2)

#     if res1
#         return 2
#     end

#     return 0
# end
# a = 3
# b = 3
# c = 3
# puts triangle(a, b, c)

# def delta_encode(array)
#     return [] if array.empty?
#     arr = []
#     arr << array[0]
#     for i in 1...array.length
#         val = array[i] - array[i-1]
#         if val <= -127 || val >= 127
#             arr << -128
#         end    
#         arr << val
#     end    
#     arr
# end
# array = [25626, 25757, 24367,24267, 16, 100, 2, 7277]
# delta_encode(array)


def howManyAgentsToAdd(noOfCurrentAgents, callsTimes)
    return if callsTimes.empty?
    call_ins = []
    call_outs = []
    callsTimes.each do |c|
        call_ins << c[0]
        call_outs << c[1]
    end 
    
    call_ins = call_ins.sort
    call_outs = call_outs.sort
    
    i = 0
    j = 0
    c = 0
    max = 0
    while(i < call_ins.length && j < call_outs.length)
        
        if(call_ins[i] < call_outs[j])
            c += 1
            max = [c, max].max
            i += 1
        else
            c -= 1
            j += 1
        end    
    end
    return max-1
    
end

noOfCurrentAgents = 1
callsTimes = [[callsTimes]]
howManyAgentsToAdd(noOfCurrentAgents, callsTimes)


def sort_hotels(keywords, hotel_ids, reviews)
    hsh = {}
    keys = keywords.split(' ') 
    for h in 0...hotel_ids.length
        reviews[h].split(' ').each do |r|
            if keys.include?(r)
                hsh[hotel_ids[h]] = hsh[hotel_ids[h]].nil? ? 1 : hsh[hotel_ids[h]] + 1
            end    
        end    
    end
        
    
end
