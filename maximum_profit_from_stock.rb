# frozen_string_literal: true

# time complexity is O(n)
# space complexity is O(1)
def maximim_profit_from_stock(_input_array)
  left = 0
  right = 1
  max_profit = 0
  while l < input_array.length
    # if it is profitable
    if input_array[r] < input_array[r]
      profit = input_array[r] - input_array[l]
      max_profit = profit > max_profit ? profit : max_profit
    else
      l += 1
    end
    r += 1
  end

  max_profit
end
