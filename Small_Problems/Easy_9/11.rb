# Group Anagrams

# Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# Write a program that prints out groups of words that are anagrams. 
# Anagrams are words that have the same exact letters in them 
# but in a different order. Your output should look something like this:

# ["demo", "dome", "mode"]
# ["neon", "none"]
# #(etc)

unique_words = words.map { |word| word.chars.sort.join }.uniq
# ["demo", "enno", "deit", "eilv", "flow"]

unique_hash = Hash[unique_words.each_with_object([]).to_a]
# {"demo"=>[], "enno"=>[], "deit"=>[], "eilv"=>[], "flow"=>[]}

words.each do |word| 
	abc_word = word.chars.sort.join
	unique_hash[abc_word] += [word] if unique_hash.include?(abc_word)
end

unique_hash.each_value { |v| p v }

# def anagrams(words)
#   anagrams = words.group_by { |word| word.chars.sort }
#   anagrams.each_value { |value| p value }
# end

# anagrams(words)