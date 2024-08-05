def binary_gap(n)

  binary_string = n.to_s(2)
  gaps =  binary_string.split("1")
  # remove leading and trailing empty strings
  gaps.shift if gaps.first == ""
  gaps.pop if gaps.last == ""

  longest_gap = gaps.map(&:length).max || 0
  longest_gap
end