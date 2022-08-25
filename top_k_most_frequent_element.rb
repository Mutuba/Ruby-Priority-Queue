def top_k_most_frequent_elements(arr, k)
  hash = {}

  freq_array = []
  (arr.length + 1).times { |_n| freq_array << [] }

  arr.each do |n|
    hash[n] = 1 + hash.fetch(n, 0)
  end

  hash.each do |key, value|
    freq_array[value] << key
  end

  result = []

  freq_array.reverse.each do |element|
    element.each do |x|
      result << x
      p result if result.length == k
    end
  end
end

topKMostFrequentElements([12, 12, 34, 56, 34, 12, 47, 40, 40, 35], 3)
