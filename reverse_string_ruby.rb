def reverse_string(input_string)
  # need to be clear whether it is a string of characters
  # or a string of words depending you call split method appropriately
  # say it is a string of characters
  character_array = input_string.chars
  result = []
  input_string.size.times do
    end_value = character_array.pop
    result << end_value
  end

  result.join
end

p reverse_string('hello')
