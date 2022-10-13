# frozen_string_literal: true

# brute force approach
# time complexity O(n2)
def product_except_self(input_array)
  result = []
  input_array.length.times { result << 0 }

  input_array.each.with_index do |_, index|
    current_product = 1
    input_array.each.with_index do |elem, inner_index|
      next if index == inner_index

      current_product *= elem
    end

    result[index] = current_product
  end
  result
end

s = [2, 1, 3, 4]
p product_except_self(s)
