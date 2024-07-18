def edit_distance(str1, str2)
  m = str1.length
  n = str2.length

  # Create a 2D array to store the edit distances
  dp = Array.new(m + 1) { Array.new(n + 1) }

  # Initialize the first row and first column
  (0..m).each { |i| dp[i][0] = i }
  (0..n).each { |j| dp[0][j] = j }

  # Fill in the rest of the matrix
  (1..m).each do |i|
    (1..n).each do |j|
      if str1[i - 1] == str2[j - 1]
        dp[i][j] = dp[i - 1][j - 1] # No operation needed if characters are the same
      else
        dp[i][j] = [
          dp[i - 1][j],    # Deletion: Remove current character from str1
          dp[i][j - 1],    # Insertion: Add current character of str2 to str1
          dp[i - 1][j - 1] # Substitution: Replace current character of str1 with str2
        ].min + 1 # Choose the operation with the minimum cost and add 1
      end
    end
  end
  puts "Mutuba #{dp}"
  # The edit distance is in the bottom-right cell
  dp[m][n]
end



# Example usage:
str1 = "aab"
str2 = "aa"
result = edit_distance(str1, str2)
puts "The edit distance between '#{str1}' and '#{str2}' is #{result}."

