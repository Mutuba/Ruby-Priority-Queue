# frozen_string_literal: true

def two_sum_sorted(input_array, target)
  left_pointer = 0
  right_pointer = input_array.length - 1
  result = []
  while left_pointer < right_pointer
    current_sum = input_array[left_pointer] + input_array[right_pointer]
    if current_sum < target
      left_pointer += 1
    elsif current_sum > target
      right_pointer -= 1
    else
      result = [right_pointer + 1, left_pointer + 1]
      break
    end
  end
  result
end

sample_array = [1, 3, 4, 5, 7, 11]

p two_sum_sorted(sample_array, 9)
