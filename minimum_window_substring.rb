# frozen_string_literal: true

def minimum_window_substring(search_string, string_to_be_found)
  return '' if string_to_be_found == ''

  string_to_be_found_hash = {}
  search_string_window_hash = {}

  # build the string_to_be_found hash
  string_to_be_found.each_char do |char|
    string_to_be_found_hash[char] = 1 + string_to_be_found_hash.fetch(char, 0)
  end

  have = 0
  need = string_to_be_found_hash.length

  result = [-1, -1]
  result_length = Float::INFINITY # any value will be less than this
  left_pointer = 0
  search_string.each_char.with_index do |char, index|
    # build the window hash with mappings ofr key, value based on search string
    search_string_window_hash[char] = 1 + search_string_window_hash.fetch(char, 0)

    # increase the haves on condition the current char, is a key in
    # string_to_be_found_hash and we have met the condition
    # for character count in the string_to_be_found_hash, i.e we need 1 A in string to be found and
    # we have 1 A from the search_string_window_hash
    have += 1 if string_to_be_found_hash.key?(char) &&
                 search_string_window_hash[char] == string_to_be_found_hash[char]

    # start reducing the substring
    while have == need
      if (index - left_pointer) < result_length
        result = [left_pointer, index] # update the result left and right pointers
        result_length = index - left_pointer # shrink or update result_length
      end

      # pop from the left
      search_string_window_hash[search_string[left_pointer]] -= 1

      # if the key at left pointer is in string_to_be_found_hash and by reducing the count for current character in
      # search_string_window_hash has resulted in the count
      # in search_string_window_hash beinf less than string_to_be_found_hash
      if string_to_be_found_hash.key?(search_string[left_pointer]) &&
         search_string_window_hash[search_string[left_pointer]] < string_to_be_found_hash[search_string[left_pointer]]
        have -= 1
      end
      # actually move the left pointer
      left_pointer += 1
    end
  end

  # pick the left and right pointers
  left, right_pointer = result

  if result_length != Float::INFINITY
    search_string[left..right_pointer]
  else
    ''
  end
end

s = 'ADOBECODEBANCWXT'
t = 'ABC'

p minimum_window_substring(s, t) #=> BANC
