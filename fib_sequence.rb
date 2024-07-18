def fibonacci_iterative(n)
  return n if n < 2

  fib0, fib1 = 0,1
  (2..n).each do |i|
    fib0, fib1 = fib1,  fib0 + fib1
  end
  fib1
  # fibonacci_recursive(n-1) + fibonacci_recursive(n-2)
end


# fibonachi_sequence(n-1) + fibonachi_sequence(n-2)
puts fibonacci_recursive(0)  # Output: 0
puts fibonacci_recursive(1)  # Output: 1
puts fibonacci_recursive(5)  # Output: 5
puts fibonacci_recursive(10) # Output: 55