def minimum_window_substring(search_string, string_to_be_found)
  return '' if t == ''

  count_t = {}
  window = {}

  string_to_be_found.each_char do |c|
    count_t[c] = 1 + count_t.fetch(c, 0)
  end

  have = 0
  need = count_t.length

  result = [-1, -1]
  result_length = Float::INFINITY
  left = 0
  search_string.each_char.with_index do |char, index|
    window[char] = 1 + window.fetch(char, 0)
    have += 1 if count_t.key?(:char) && window[char] == count_t[char]

    while have == need
        if( index- left + 1 ) < result_length
            result = [left, index]
            result_length = index- left + 1 
        end

        # pop from the left
        window[search_string[l]] -= 1

        if count_t.key?(search_string[left]) && window[search_string[left]] < count_t[search_string[left]]
            have -= 1
        end
    end
  end

  left, right_index = result 

   search_string[left : right_index + 1] if result_length != Float::INFINITY else ""
end
