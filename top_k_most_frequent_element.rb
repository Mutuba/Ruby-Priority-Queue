# def top_k_most_frequent_elements(arr, k)
#   hash = {}

#   freq_array = []
#   (arr.length + 1).times { freq_array << [] }

#   arr.each do |n|
#     hash[n] = 1 + hash.fetch(n, 0)
#   end

#   hash.each do |key, value|
#     freq_array[value] << key
#   end

#   result = []

#   freq_array.reverse.each do |element|
#     element.each do |x|
#       result << x
#       p result if result.length == k
#     end
#   end
# end

# topKMostFrequentElements([12, 12, 34, 56, 34, 12, 47, 40, 40, 35], 3)

def top_k_most_frequent_elements(input_array, k)
  hash = {}
  freq_array = []

  (input_array.length + 1).times { freq_array << [] }
  input_array.each do |elem|
    hash[elem] = 1 + hash.fetch(elem, 0)
  end

  # populate the frequency array inner arrays
  hash.each do |key, value|
    freq_array[value] << key
  end

  result = []
  # loop in reverse so as to start with most frequent depending on hash count
  freq_array.reverse.each do |inner_array|
    inner_array.each do |element|
      result << element
      if result.length == k
        return result
        break
      end
    end
  end
end

sample_array = [12, 12, 34, 56, 34, 12, 47, 40, 40, 35]
p top_k_most_frequent_elements(sample_array, 3)
