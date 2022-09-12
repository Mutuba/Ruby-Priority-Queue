# Given an array S of n integers, are there elements a, b, c, and d in S such that a + b + c + d = target?
# Find all unique quadruplets in the array which gives the sum of target.

# Note:

# Elements in a quadruplet (a,b,c,d) must be in non-descending order. (ie, a ≤ b ≤ c ≤ d).
# The solution set must not contain duplicate quadruplets. For example, given array S = {1 0 -1 0 -2 2}, and target = 0.

def four_sum(nums, target)
  length = nums.length - 1
  return [] if length < 3

  res = []
  # this ensures that the result conforms to non-descending order. (ie, a ≤ b ≤ c ≤ d)
  nums.sort!

  # no need to proceed beyond length-3 as the array is sorted
  # and inner loops will cover the remaining section of the array

  (0..length - 3).each do |i|
    # skip duplicates as the set of numbers should be unique
    next if (nums[i] == nums[i - 1]) && (i > 0)

    (i + 1..length - 2).each do |j|
      l = j + 1
      k = length
      # makes sense to break and try another combination for i, j, l, l+1
      # if greater than target, as we will never find a sum lesser as the
      # array is sorted
      break if nums[i] + nums[j] + nums[l] + nums[l + 1] > target
      # if combining with last two elements, sum is less than target, then abort early
      # as we will never have a sum greater than that as it is less than target
      # since our array is sorted
      next if nums[i] + nums[j] + nums[k - 1] + nums[k] < target
      next if (nums[j] == nums[j - 1]) && (j > i + 1) # skip duplicates

      # try to find possible combinations
      while l < k
        tmp = nums[i] + nums[j] + nums[l] + nums[k]

        if tmp == target
          res << [nums[i], nums[j], nums[k], nums[l]]
          # prevent the while loop from executing forever
          l += 1
          k -= 1
          # make sure you take care of duplicates
          l += 1 while nums[l] == nums[l - 1]
          k -= 1 while nums[k] == nums[k + 1]
        # move right pointer in wards
        elsif tmp > target
          k -= 1
        # move left pointer to the right
        else
          l += 1
        end
      end
    end
  end

  res
end

s = [1 ,0, -1, 0, -2, 2]

p four_sum(s, 0)