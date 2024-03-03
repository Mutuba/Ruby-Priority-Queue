# def longest_substring_with_k_distinct_character(input_string, k)
#   max_string = ''
#   current_max_substring = ''
#   hash = {}

#   return nil if input_string.length == 0 || k <= 0 || k > input_string.length || input_string == ''

#   # complexity is O(k) for inner loop
#   # and O(n) for the outer loop hence O(n)
#   # time complexity is O(n) and space complexity of 0(n) for creating a hashmap

#   (0..(input_string.length - 1)).each do |index|
#     count = 0
#     right = index

#     while count <= k && right < input_string.length
#       # if element not in the hash, then it is unique, add to the hash, increase the count
#       # else not unique, just increase the window
#       if hash.key?(input_string[right])
#         right += 1
#         next
#       end
#       # element is unique add to the hash, increase the count
#       hash[input_string[right]] = 1
#       right += 1
#       count += 1
#     end
#     current_max_substring = input_string[index...right - 1]
#     max_string = current_max_substring if current_max_substring.length > max_string.length
#     hash.clear
#   end

#   max_string
# end

# sample_string = 'bccbababcedd'

# p longest_substring_with_k_distinct_character(sample_string, 2)


def longest_substring_with_k_distinct_character(input_string, k)
  max_string = ''
  (0..(input_string.length - 1)).each do |index|
    hash = {}
    count =  0
    right = index
    while count <= k && right < input_string.length
      if hash.key?(input_string[right])
        right += 1
        next
      end

      if count == k
        break
      end

      hash[input_string[right]] = 1
      right += 1
      count += 1
    end

    current_max_substring = input_string[index...right]
    max_string = current_max_substring if current_max_substring.length > max_string.length
  end
  max_string
end


sample_string = 'bccbababcedd'

p longest_substring_with_k_distinct_character(sample_string, 2)