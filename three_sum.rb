def three_sum(input_array, target)
  hash = {}
  
  # Store each element and its index in the hash
  input_array.each_with_index do |elem, index|
    hash[elem] = index
  end

  result = []

  input_array.each_with_index do |element, index|
    difference = target - element

    (index + 1..input_array.length - 1).each do |inner_index|
      target_num = difference - input_array[inner_index]
      
      # Ensure we're not using the same element twice
      if hash.key?(target_num) && hash[target_num] != inner_index
        result = [hash[target_num], inner_index, index]
        return result
      end
    end
  end

  result
end

sample_array = [3, 4, 2, 5, 6, 8, 9, 10]

# sample_array = [-1, 0, 1, 2, -1, -4]
p three_sum(sample_array, 9)
