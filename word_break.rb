def word_break(search_string, word_list)
  # if we can ever get to the last index, then we return true
  dp = [false] * search_string.length
  dp[search_string.length] = true

  # loop over the string from end to start
  (search_string.length - 1).downto(0).each do |index|
    word_list.each do |word|
      if (index + word.length) <= search_string.length &&
         # word.length will be off for words at the biggining and middle
         search_string[index...(index + word.length)] == word

        dp[index] = dp[index + word.length]
      end
      break if dp[index]
    end
  end

  # will be true if the word can be broken
  dp[0]
end

# s = 'catsandog'
# a = %w[ap app appl ep epen]
# a = ["cats","dog","sand","and","cat"]

s = 'javapython'
a = %w[java python]

p word_break(s, a)
