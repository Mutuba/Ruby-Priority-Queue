def reverse_string(input_string)
  # need to be clear whether whether it is a string of characters
  # or a string of words depending you call split method appropriately
  # say it is a string of characters
  character_array = input_string.chars
  result = []
  character_array.size.times { result << character_array.pop }

  result.join
end

p reverse_string('hello')
