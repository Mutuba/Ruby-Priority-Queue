# factorial 0 = 1, 1 = 1, 2 = 2

def factorial(n)
  if n < 0 
    return "Not applicable for numbers negative numbers"
  end

  if n == 0
    return 1
  end

  result = 1
  (2..n).each do |i|
    result  = result * i
  end

  result
end

def factorial_recursive(n)
  if n < 0 
    return "Not applicable for numbers negative numbers"
  end

  if n == 0
    return 1
  end
  return n * factorial_recursive(n-1)
end

def factorial_recursive_with_memo(n, memo = {})
  return "Not applicable for negative numbers" if n < 0
  return 1 if n == 0

  if memo[n]
    return memo[n]
  end

  memo[n] = n * factorial_recursive_with_memo(n - 1, memo)
  memo[n]
end

p factorial(5)
p factorial_recursive(5)
p factorial_recursive_with_memo(5)
