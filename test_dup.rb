def remove_duplicates(array)
  uniq_set = Set.new
  array.each do |element|
    ## checing for set inclusion is faster than for array
    unless uniq_set.include? element
      uniq_set.add(element)
    end
  end

  uniq_set.to_a
end

# Example usage:
array = [1, 2, 2, 3, 4, 4, 5]
result = remove_duplicates(array)
puts "Original array: #{array}"
puts "Array without duplicates: #{result}"
