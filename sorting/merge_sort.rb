# A sorting algorithm is said to be stable if two objects with equal keys appear in the same order in sorted output as they appear in the input array to be sorted.
# some sorting algorithms are stable by nature like Insertion sort, Merge Sort, Bubble Sort, etc.
# And some sorting algorithms are not like HeapSort, QuickSort etc

# Insertion Sort has lower overhead than Merge Sort if dataset is small.
# Merge Sort is good choice if dataset are too large to fit in memory, Example: sort content of large file(split them in smaller files and read that in memory)
# Worst, Average, Best Time Complexity is o(nlogn) and space is o(n)
# Its stable but not in-place

def merge_sort(arr, low = 0, hi = arr.length-1)
  if low != hi
    mid = (low+hi)/2
    merge_sort(arr, low, mid)
    merge_sort(arr, mid+1, hi)
    merge(arr, low, mid, mid+1, hi)
  end
end

def merge(arr, a, b, x, y)
  arr_left = Array.new(b-a+1); l = 0
  arr_right = Array.new(y-x+1); r = 0

  for i in a..b
    arr_left[l] = arr[i]
    l += 1
  end

  for i in x..y
    arr_right[r] = arr[i]
    r += 1
  end
  i = 0; j = 0; k = a
  while(i < l && j < r)
    if arr_left[i] <= arr_right[j]
      arr[k] = arr_left[i]
      i += 1
    else
      arr[k] = arr_right[j]
      j += 1
    end
    k += 1
  end

  while(i < l)
    arr[k] = arr_left[i]
    i += 1; k += 1
  end

  while(j < r)
    arr[k] = arr_right[j]
    j += 1; k += 1
  end
end

arr = [38, 27, 43, 3, 9, 82, 10]
puts arr.to_s
merge_sort(arr)
puts arr.to_s