def findLeaders(arr):
	n = len(arr)
	leader = arr[n-1]
	print(leader)
	for i in range(n-1, 0, -1):
		if(arr[i] > leader): 
			leader = arr[i]
			print(leader)

arr = [16, 17, 4, 3, 5, 2]
findLeaders(arr)