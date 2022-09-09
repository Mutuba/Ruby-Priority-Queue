# def anagram_list(word)
#   words = File.readlines('/usr/share/dict/words')

#   words_hash = words.each_with_object(Hash.new([])) do |word, hash|
#     hash[word.chomp.chars.sort.join] += [word.chomp]
#   end

#   words_hash[word.chars.sort.join]
# end

# p anagram_list('suacal')

def generate_anagrams(word)
    words_list = File.readlines('/usr/share/dict/words').map(&:chomp)
    dict = Hash.new { |h, k| h[k] = [] }

    words_list.each do |word|
        dict[word.chars.sort.join] << word
    end

    dict[word.chars.sort.join]
end

p generate_anagrams('saucal')
