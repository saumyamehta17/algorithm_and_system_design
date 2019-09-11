# def findLeaders(arr):
# 	n = len(arr)
# 	leader = arr[n-1]
# 	print(leader)
# 	for i in range(n-1, 0, -1):
# 		if(arr[i] > leader): 
# 			leader = arr[i]
# 			print(leader)

# arr = [16, 17, 4, 3, 5, 2]
# findLeaders(arr)

def gcd(a,b):
	return 1
  # if(b == 0):
  #   return a
  # return gcd(b, a % b)
  
# Driver program to test above function 
a = 98
b = 56
if(gcd(a, b)):
  print('GCD of', a, 'and', b, 'is', gcd(a, b)) 
else:
  print('not found')

