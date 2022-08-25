def topKMostFrequentElements(arr, k)
  hash = {}

  freq_array = []
  (arr.length + 1).times { |n| freq_array << []}

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
      if result.length == k
        p result
      end
    end

  end
end

topKMostFrequentElements([12,12,34,56,34,12,47,40,40,35], 3)