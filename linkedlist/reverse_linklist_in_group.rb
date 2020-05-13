def reverse_k_group(head, k)
    return head if k <= 1 || head.nil? || head.next.nil?

    c = 0; prev = nil; curr = head

    while(c < k && !curr.nil?)
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
k = 3
puts reverse_k_group(head, k)