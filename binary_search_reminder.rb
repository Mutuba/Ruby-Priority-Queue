def binary_search(array, target)
  low = 0
  high = array.length - 1

  while low <= high
    mid = (low + high) / 2
    mid_value = array[mid]

    case mid_value <=> target
    when 0
      return true
    when 1
      high = mid - 1
    when -1
      low = mid + 1
    end
  end

  false
end

array = (1..10).to_a
result = binary_search(array, 10)
puts result