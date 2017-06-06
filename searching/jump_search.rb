require('pry')
arr = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610]
def jump_search(arr, val)
  n = arr.length;
  step = Math.sqrt(n).floor
  prev = 0
  c = 1

  while((arr[step] - 1) < val)
    prev = step;
    step += Math.sqrt(n).floor
    if prev > n
      return -1
    end
  end

  while(arr[prev] < val)
    prev += 1
    if(prev == [step,n].min)
      return -1
    end
  end

  if(arr[prev] == val)
    puts 'FOUND'
    return val
  end

  return -1;

end

jump_search(arr, 56);
