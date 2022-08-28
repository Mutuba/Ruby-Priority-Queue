def two_sum(input_array, target)
  array_hash = {}
  result = []
  input_array.each.with_index do |element, index|
    difference = target - element
    result = [array_hash[difference], index] if array_hash.key?(difference)
    array_hash[element] = index
  end

  result
end

sample_array = [2, 7, 11, 15]

p two_sum(sample_array, 9)
