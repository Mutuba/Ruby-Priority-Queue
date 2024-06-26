require 'set'

def longest_substring_with_no_repeating_character(input_string)
  # Initialize a set to keep unique characters
  character_set = Set.new
  # Initialize pointers
  i = 0
  j = 0
  longest = 0
  start = 0
  longest_substring= ""
  
  while j < input_string.length
    if !character_set.include?(input_string[j])
      character_set.add(input_string[j])
      j += 1
      if j - i > longest
        longest = j - i
        longest_substring = input_string[i...j]
      end
    else
      character_set.delete(input_string[i])
      i += 1
    end
  end

  longest_substring
end

# Test cases
s1 = 'abcabcbb'
s2 = 'bbbbb'
s3 = 'pwwkew'
s4 = 'abbac'

p longest_substring_with_no_repeating_character(s1) # ➞ "abc"
p longest_substring_with_no_repeating_character(s2) # ➞ "b"
p longest_substring_with_no_repeating_character(s3) # ➞ "wke"
p longest_substring_with_no_repeating_character(s4) # ➞ "bac"
