require 'set'

def longest_substring_with_no_repeating_character(input_string)
  # initialize a set to keep unique character
  character_set = Set.new
  # initialize pointers
  i = 0
  j = 0
  longest = 0
  while i < input_string.length && j < input_string.length
    # move left pointer if set not unique
    if character_set.include?(input_string[j])
      character_set.delete(input_string[i])
      i += 1
    else
      character_set << input_string[j]
      longest = character_set.length > longest ? character_set.length : longest
      j += 1
    end
  end
  character_set.to_a.join
end

s = 'abbac'

p longest_substring_with_no_repeating_character(s)
