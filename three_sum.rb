def three_sum(input_array, target)
  hash = {}

  # works if no duplicates
  input_array.each.with_index do |elem, index|
    hash[elem] = index
  end
  result = []
  input_array.each_with_index do |element, index|
    difference = target - element
    input_array[index + 1..].each_with_index do |element, inner_index|
      num = difference - element
      result = [hash[num], inner_index, index] if hash.key?(num) && hash[num] != inner_index
    end
  end

  result
end

sample_array = [3, 4, 2, 5, 6, 8, 9, 10]

# sample_array = [-1, 0, 1, 2, -1, -4]
p three_sum(sample_array, 9)
