def remove_duplicates_from_sorted_array(input_array)
  # taking advantage of a sorted array
  # have two pointers both running from the biggining
  # of the array i.e slow and fast pointers at indeces 0 and 1 respectively
  # whenever you encounter a unique element at fast index copy it to slow index
  # else for duplicate (elem[slow] == elem[fast]), move the fast pointer

  # time complexity (O(n)), space complexity O(1), no extra memory used
  slow = 0
  fast = 1
  while fast < input_array.size
    if input_array[slow] != input_array[fast]
      slow += 1
      input_array[slow] = input_array[fast]

    end
    fast += 1
  end

  slow + 1
end

sample_array = [2, 2, 2, 2, 2, 3, 3, 3]

p remove_duplicates_from_sorted_array(sample_array)
