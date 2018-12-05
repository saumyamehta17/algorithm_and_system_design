def topost(inorder, preorder, n)
  indx = search(inorder, preorder[0], n)
  # puts indx
  if(indx == -1)
      puts 'Something went wrong'
      return
  end
  if(indx != 0)
    # puts "---left subtree --> preorder: #{preorder} -- root: #{indx} -- n: #{n}"
    pr = preorder.dup; pr.shift
    # puts "left subtree --> preorder: #{preorder} pre: #{pr.to_s} -- root: #{indx} -- n: #{n}"
    topost(inorder, pr, indx)
  end

  if(indx != n-1)
    pr = preorder.dup; pr.shift(indx+1)
    ino = inorder.dup
    # puts "right subtree --> preorder: #{preorder} inorder: #{inorder} pre: #{pr.to_s} -- root: #{indx} -- n: #{n}"
    ino.shift(indx+1)
    topost(ino, pr, n-indx-1)
  end
  puts " #{preorder[0]}"  
  return  
end

def search(inorder, pre, n)  
  i = 0
  while(i < n)
    if(inorder[i] == pre)
      return i
    end
    i += 1  
  end
  return -1  
end  
inorder = [4, 2, 5, 1, 3, 6]
preorder = [1, 2, 4, 5, 3, 6]
n = 6
topost(inorder, preorder, n)