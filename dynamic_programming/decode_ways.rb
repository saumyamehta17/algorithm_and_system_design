# TimeComplexity is o(n)
def num_decodings(s)
  n = s.length
  memo = Array.new(n+1)
  helper(s, n, memo)
end

def helper(s, n, memo)
  return 1 if n == 0
  i = s.length - n
  return 0 if s[i] == '0'

  return memo[n] if memo[n]

  result = helper(s, n-1, memo)
  if n >= 2 && valid?(s[i...(i+2)])
    result += helper(s, n-2, memo)
  end
  memo[n] = result
  result
end

# Time Complexity o(2**n)
def num_decodings_v2(s)
  n = s.length
  helper_v2(s, n)
end

def helper_v2(s, n)
  return 1 if n == 0
  i = s.length - n
  return 0 if s[i] == '0'

  result = helper_v2(s, n-1)
  if n >= 2 && valid?(s[i...(i+2)])
    result += helper_v2(s, n-2)
  end
  result
end

def valid?(s)
  return false if s[0] == '0'
  (1..26).include? s.to_i
end

test_cases = ['0', '011', '11111', '123']
test_cases.map {|s| num_decodings(s) }