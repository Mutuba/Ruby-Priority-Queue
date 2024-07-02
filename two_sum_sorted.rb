def two_sum_sorted(nums, target)
  left = 0
  right = nums.length - 1

  while left < right
    current_sum = nums[left] + nums[right]

    case current_sum <=> target
    when 0
      return [left, right]
    when 1
      right -= 1
    when -1
      left += 1
    end

    # if current_sum == target
    #   return [left, right] 
    # elsif current_sum < target
    #   left += 1  
    # else
    #   right -= 1 
    # end
  end

  return nil 
end

sample_array = [1, 3, 4, 5, 7, 11]

p two_sum_sorted(sample_array, 9)
