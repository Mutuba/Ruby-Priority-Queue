def edit_distance(str1, str2)
  # create a map from the two strings
  m = str1.length
  n = str2.length

  dp = Array.new(n+1) {Array.new(m+1)}
  # fill first row and column
  (0..m).each { |i| dp[i][0] = i} 
  (0..n).each { |j| dp[0][j] = j} 

  # fill the rest of the array
  (1..m).each do |i|
    (1..n).each do |j|
      if str1[i-1] == str2[j-1]
        dp[i][j] = dp[i-1][j-1]
      else
        # deletion , insertion, substitution
        dp[i][j] = [dp[i-1][j], dp[i][j-1], dp[i-1][j-1]].min+1
      end
    end
  end

  dp[m][n]
end