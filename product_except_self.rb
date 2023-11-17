# brute force approach
# time complexity O(n2)

def product_except_self(input_array)
  result = []
  input_array.length.times { result << 0 }

  input_array.eachindex do |index|
    current_product = 1
    input_array.each.with_index do |elem, inner_index|
      next if index == inner_index

      current_product *= elem
    end

    result[index] = current_product
  end
  result
end

test_array = [2, 1, 3, 4]
p product_except_self(test_array)


# rafoctorings using each_index as we don't need the element

def product_except_self(input_array)
  result = []
  input_array.length.times { result << 0 }

  input_array.each_index do |index|
    current_product = 1
    input_array.each_index do |inner_index|
      next if index == inner_index

      current_product *= input_array[inner_index]
    end

    result[index] = current_product
  end
  result
end

test_array = [2, 1, 3, 4]

p product_except_self(test_array)

# the O(n) solution
def product_except_self(input_array)
  input_product = input_array.reduce(:*)
  input_array.map { |element| input_product / element }
end

test_array = [2, 1, 3, 4]

p product_except_self(test_array)