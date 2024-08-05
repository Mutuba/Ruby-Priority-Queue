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
          dp[i - 1][j],    # Deletion: Remove current character from str1 CAT vs CATS and you compare CA vs CATS 
          dp[i][j - 1],    # Insertion: Add current character of str2 to str1 CAT vs CATS and you have CAT VS CAT 
          dp[i - 1][j - 1] # Substitution: Replace current character of str1 with str2 CUT vs CAT
        ].min + 1 # Choose the operation with the minimum cost and add 1
      end
    end
  end
  puts "Mutuba #{dp}"
  # The edit distance is in the bottom-right cell
  dp[m][n]
end

# Consider transforming str1 = "cat" into str2 = "cats".

# Deletion (dp[i-1][j]): If you delete the last character "t" from "cat", you’re left with "ca" which is easier to compare against "cats". The cost is dp[2][3] (transform "ca" into "cats") + 1 for deleting "t".

# Insertion (dp[i][j-1]): If you’ve already transformed "cat" into "cat", you just need to insert the "s" at the end to match "cats". The cost is dp[3][2] (transform "cat" into "cat") + 1 for inserting "s".


# Example usage:
str1 = "aab"
str2 = "aa"
result = edit_distance(str1, str2)
puts "The edit distance between '#{str1}' and '#{str2}' is #{result}."

