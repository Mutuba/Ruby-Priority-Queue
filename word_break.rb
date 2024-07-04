def word_break(s, word_dict)
  # Base case: empty string can always be segmented
  return true if s.empty?  

  n = s.length 
  dp = Array.new(n, false)
  # Base case: an empty prefix can always be segmented
  dp[0] = true  

  (1..n).each do |end_index|
    (0...end_index).each do |start_index|
      # Check if dp[start_index] is true (meaning the substring s[0...start_index] can be segmented) 
      # and if s[start_index...end_index] exists in the dictionary (word_dict).
      # if the segment exists in the dictionary
      if dp[start_index] && word_dict.include?(s[start_index...end_index])
        # By setting dp[end_index] = true, we mark that the substring s[0...end_index] 
        # can indeed be segmented into valid words from word_dict
        dp[end_index] = true
        break
      end
    end
  end

   # Check the end end index, if true then it can be segmented
   # indicates whether the entire string can be segmented
  dp[n] 
end

# Example usage:
# word_dict = ["apple", "pen"]
# puts word_break("applepenapple", word_dict)  # Output: true

# word_dict = ["cats", "dog", "sand", "and", "cat"]
# puts word_break("catsandog", word_dict)  # Output: false


s = 'javapython'
a = ["java", "python"]

p word_break(s, a)
