def longest_substring_with_atleast_k_distinct_character(input_string, k)
  max_string = ''
  (0..(input_string.length - 1)).each do |index|
    hash = Hash.new(0)
    right = index
    while right < input_string.length
      hash[input_string[right]] = 1
      right += 1
    end

    if hash.keys.length >= k
      current_max_substring = input_string[index...right]
      max_string = current_max_substring if current_max_substring.length > max_string.length
    end
  end
  max_string
end