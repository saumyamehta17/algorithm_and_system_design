# @param {Character[][]} board
# @return {Boolean}
def find_judge(n, trust)
    sum = (n*(n+1))/2

    trustee_sum = 0
    hsh = Hash.new []

    trust.each do |t|
        trustee_sum += t[0] if hsh[t[0]].empty?
        hsh[t[0]] += [t[1]]
    end

    return -1 if hsh.keys.length != n-1

    candidate = sum - trustee_sum

    hsh.each do |k,v|
        return -1 if !v.include?(candidate)
    end
    return candidate
end
n = 2
trust = [[1,2]]
puts find_judge(n, trust)

def reverse_k_group(head, k)
    return head if k <= 1 || head.nil? || head.next.nil?

    c = 0; prev = nil; curr = head

    while(c <= k && !curr.nil?)
        nn = curr.next
        curr.next = prev if prev
        prev = curr
        curr = nn
        c += 1
    end

    if c == k && curr.nil?
        return prev
    elsif curr.nil?
        return head
    else
        head.next = reverse_k_group(curr, k)
    end
    return prev
end
Node = Struct.new(:data, :next)
head = Node.new(1)
head.next = Node.new(2)
head.next.next = Node.new(3)
head.next.next.next = Node.new(4)
head.next.next.next.next = Node.new(5)
k = 2
# puts reverse_k_group(head, k)
# def all_turned_bulbs_shines?(bulbs, i, n)
#   while(i < n)
#     if bulbs[i] == 1
#       return false
#     end
#     i += 1
#   end
#   true
# end

# def find_moments(arr)
#   moments = 0
#   n = arr.length
#   bulbs = Array.new(n, 0)

#   for i in 0...n
#     j = arr[i] - 1

#     if j == 0 || bulbs[j-1] == 2
#       bulbs[j] = 2
#       k = j+1
#       while(bulbs[k] && bulbs[k] == 1)
#         bulbs[k] = 2
#         k += 1
#       end

#       if all_turned_bulbs_shines?(bulbs, j, n)
#         moments += 1
#       end
#     else
#       bulbs[j] = 1
#     end
#   end

#   moments
# end

# arr = [2,1,3,5,4]
# arr = [2,3,4,1,5]
# arr = [1,3,4,2,5]
# puts find_moments(arr)

# def fib(n)
#   if n == 0 || n == 1
#     return n
#   end

#   fib(n-1) + fib(n-2)
# end

# def print_permutations(str)
# 	map = Hash.new(0)
# 	str.each_char { |chr| map[chr] += 1}
# 	chars = map.keys.sort
# 	count = Array.new(0, chars.size)
# 	chars.each_with_index { |chr, i| count[i] = map[chr]}
# 	helper(chars, count, 0, Array.new(str.length))
# end

# def helper(chars, count, level, result)
# 	if level == result.length
# 		puts result.join
# 		return
# 	end

# 	for i in 0...count.length
# 		next if count[i] == 0
# 		new_count = count.dup
# 		new_count[i] -= 1
# 		result[level] = chars[i]
# 		helper(chars, new_count, level + 1, result.dup)
# 	end
# end

# for str in ['BCA', 'ABB']
# 	puts "Input: #{str}"
# 	print_permutations str
# end
