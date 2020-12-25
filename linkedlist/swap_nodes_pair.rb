def swap_pairs(head)
  return head if head.nil? || head.next.nil?

  next_node = head.next
  next_next_node = head.next.next
  next_node.next = head
  head.next = swap_pairs(next_next_node)
  next_node
end