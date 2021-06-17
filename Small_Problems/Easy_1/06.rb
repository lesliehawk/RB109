# Reverse It (Pt 2)

# Write a method that takes one argument,
# a string containing one or more words,
# and returns the given string with words
# that contain five or more characters reversed.
# Each string will consist of only letters and spaces.
# Spaces should be included
# only when more than one word is present.

def reverse_words(words)
  words_arr = words.split
  words_arr.each do |word|
    word.reverse! if word.length >= 5
  end

  words_arr.join(' ')
end

# Examples:
p reverse_words('Professional')          # => lanoisseforP
p reverse_words('Walk around the block') # => Walk dnuora the kcolb
p reverse_words('Launch School')         # => hcnuaL loohcS