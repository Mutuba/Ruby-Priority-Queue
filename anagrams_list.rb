# def anagram_list(word)
#   words = File.foreach('/usr/share/dict/words').map(&:chomp)

#   words_hash = words.each_with_object(Hash.new([])) do |word, hash|
#     hash[word.chars.sort.join] += [word]
#   end

#   words_hash[word.chars.sort.join]
# end

# p anagram_list('suacal')

def generate_anagrams(lookup_word)
  words_list = File.foreach('/usr/share/dict/words').map(&:chomp)
  dict = Hash.new { |h, k| h[k] = [] }

  words_list.each do |word|
    dict[word.chars.sort.join] << word
  end

  dict[lookup_word.chars.sort.join]
end

p generate_anagrams('saucal')
