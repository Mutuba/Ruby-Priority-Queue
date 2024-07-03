def prime?(number)
  # Return false for numbers less than 2, since 0 and 1 are not prime numbers
  return false if number < 2

  # Check for factors from 2 up to the square root of the number
  (2..Math.sqrt(number)).each do |i|
    return false if number % i == 0
  end

  # If no factors were found, the number is prime
  true
end

# Example usage:
puts prime?(2)     # Output: true
puts prime?(3)     # Output: true
puts prime?(4)     # Output: false
puts prime?(17)    # Output: true
puts prime?(18)    # Output: false
puts prime?(19)    # Output: true
