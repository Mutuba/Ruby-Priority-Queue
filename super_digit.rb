def super_digit(input_num, k)
  ultimate_array = input_num.to_s.split('') * k
  # return early if single element
  return 1 if ultimate_array.length == 1

  calculate_result(ultimate_array)
end

def calculate_result(concateneted_array)
  result = 0
  concateneted_array.each do |element|
    result += element.to_i
  end
  # return current result if one element
  return result if result.to_s.length == 1

  # recursively call the calculate result method
  calculate_result(result.to_s.split(''))
end

# p super_digit(148, 3)

# 148 148 148
# 39
# 12
# 3

def sum_of_digits(input_num)
  # input_num.to_s.split('').map(&:to_i).reduce(&:+)
  input_num.digits.sum
end

def recusive_sum_of_digits_caller(input_num)
  if input_num < 10 
    return input_num
  end
  recursive_sum = sum_of_digits(input_num)

  recusive_sum_of_digits_caller(recursive_sum)
end

def super_digit_version_2(input_num, k)
  return input_num if input_num < 10 

  initial_sum  = sum_of_digits(input_num) * k 

  recusive_sum_of_digits_caller(initial_sum)
end

p super_digit_version_2(148, 3)
