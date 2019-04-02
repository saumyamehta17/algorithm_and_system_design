def heapifyBinaryTree(node)
	size = traverse(node)
	arr = Array.new(size)
	traverse(node, 0, arr)

	# puts arr.to_s
	sort_nodes(arr, 0, size-1)
	

	for i in 0...size
		left = 2*i + 1
		right = 2*i + 2

		arr[i].left =  left < size ? arr[left] : nil
		arr[i].right =  right < size ? arr[right]: nil
	end	

	puts arr[0]
end	

def sort_nodes(arr, low, hi)
	if low < hi
		pivot_indx = getPivotIndex(arr, low, hi)
		sort_nodes(arr, low, pivot_indx-1)
		sort_nodes(arr, pivot_indx+1, hi)
	end	
end	

def getPivotIndex(arr, low, hi)
	pivot = arr[hi].data
	i = j = low
	while(i <= hi)
		if arr[i].data < pivot
			swap(arr, i,j) if i != j
			j += 1
		end
		i += 1	
	end
	swap(arr,j,hi) if j != hi
	j
end

def swap(arr,i,j)
	tmp = arr[i]
	arr[i] = arr[j]
	arr[j] = tmp
end	

def traverse(node, count = 0, arr = nil)
	return count if node.nil?
	if !arr.nil?
		arr[count] = node
	end
	count += 1
	count = traverse(node.left, count, arr)	
	count = traverse(node.right, count, arr)	
	count
end	

Node = Struct.new(:data, :left, :right)
head = Node.new(10)
head.left = Node.new(90)
head.left.left = Node.new(2)
head.right = Node.new(11)
head.right.left = Node.new(7)
head.right.left.left = Node.new(9)

heapifyBinaryTree(head)