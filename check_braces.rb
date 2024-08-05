def matching_braces?(string)
  matching_braces = {"{" => "}", "[" => "]", "(" => ")"}
  stack = []

  string.each_char do |char|
    if matching_braces.keys.include?(char)
      stack.push(char)
    else
      # it is an closing brace
      return false if stack.empty? || char != matching_braces[stack.pop]
    end
  end
  return stack.empty?
end

puts matching_braces?("()[]{}")      # true
puts matching_braces?("(]")          # false
puts matching_braces?("([{}])")      # true
puts matching_braces?("([{})")       # false