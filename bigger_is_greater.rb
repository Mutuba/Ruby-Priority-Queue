# def bigger_is_greater(input_array)
#   string_array = input_array.split('')

#   index_with_first_smaller_character = 0

#   (string_array.length - 1).downto(1).each do |index|
#     if string_array[index] > string_array[index - 1]
#       index_with_first_smaller_character = index
#       break
#     end
#   end

#   return 'no answer' if index_with_first_smaller_character == 0

#   first_smaller_character = string_array[index_with_first_smaller_character - 1]
#   next_bigger_character_index = index_with_first_smaller_character

#   # look for a much smaller character bigger than first_smaller_character
#    # and smaller than character at string_array[next_bigger_character_index]

#   ((next_bigger_character_index + 1)..(string_array.length - 1)).each do |index|
#     if string_array[index] > first_smaller_character && string_array[index] < string_array[next_bigger_character_index]
#       next_bigger_character_index = index
#     end
#   end

#   # swap the elements, the current smallest with the next smallest,
#   # bigger than it, less than element on the right of smallest

#   swap(string_array, index_with_first_smaller_character - 1, next_bigger_character_index)

#   # sort the array from
#   sorted_subarray = string_array[index_with_first_smaller_character..string_array.length].sort!

#   sub_array = string_array[0..index_with_first_smaller_character - 1]
#   sorted_subarray.each do |sorted_element|
#     sub_array << sorted_element
#   end
#   sub_array.join('')
# end

# def swap(array_to_be_swapped, i, j)
#   temp = array_to_be_swapped[i]
#   array_to_be_swapped[i] = array_to_be_swapped[j]
#   array_to_be_swapped[j] = temp
# end

# p bigger_is_greater('ecdigf')

def bigger_is_greater(test_string)
  test_string_array = test_string.split('')

  first_smaller_character_than_previous_index = 0

  # iterate from the end of string array until you find an element less than
  # element before, and return the element's index else return no element found
  (test_string_array.length - 1).downto(1).each do |index|
    if test_string_array[index] > test_string_array[index - 1]
      first_smaller_character_than_previous_index = index
      break
    end
  end

  return 'not found' if first_smaller_character_than_previous_index == 0

  first_smaller_character_than_previous = test_string_array[first_smaller_character_than_previous_index - 1]
  next_smaller_index_than_previous = first_smaller_character_than_previous_index

  ((next_smaller_index_than_previous + 1)..(test_string_array.length - 1)).each do |index|
    if test_string_array[index] > first_smaller_character_than_previous && test_string_array[index] < test_string_array[next_smaller_index_than_previous]
      next_smaller_index_than_previous = index
    end
  end

  # swap the next smallest element found with the current smallest
  exchange_elements(test_string_array, first_smaller_character_than_previous_index - 1,
                    next_smaller_index_than_previous)
  # sort elements right of first_smaller_character_than_previous

  sorted_elements = test_string_array[first_smaller_character_than_previous_index, test_string_array.length - 1].sort!

  result = test_string_array[0..first_smaller_character_than_previous_index - 1]

  sorted_elements.each do |elem|
    result << elem
  end

  # join and return

  result.join('')
end

def exchange_elements(sample_array, i, j)
  temp = sample_array[i]
  sample_array[i] = sample_array[j]
  sample_array[j] = temp
end

p bigger_is_greater('ecdigf')
