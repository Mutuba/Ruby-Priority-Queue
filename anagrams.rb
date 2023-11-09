# def is_anagram(first_word, second_word)
#   first_word_sorted = first_word.chars.sort.join
#   second_word_sorted = second_word.chars.sort.join
#   position = 0
#   matches = true

#   while position < first_word.length && matches
#     if first_word_sorted[position] == second_word_sorted[position]
#       position += 1

#     else
#       matches = false

#     end
#   end
#   matches
# end


def is_anagram(first_word, second_word)
  return false unless first_word || second_word
  
  return false if first_word_sorted.length != second_word.length

  first_word_sorted = first.chars.sort.join
  second_word_sorted = second_word.chars.sort.join

  position = 0
  character_matches = true
  while position < first_word_sorted.length && character_matches
    
    if first_word_sorted[position] == second_word_sorted[position]
      position += 1
    else
      character_matches = false
    end
  end
  character_matches
end