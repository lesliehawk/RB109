# Letter Counter (Part 1)
# Write a method that takes a string with one or more space separated words
# and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

def word_sizes(sentence)
  hash = {}
  sizes = sentence.split(' ').map { |word| word.size }
  sizes.each { |length| hash[length] = sizes.count(length)}
  hash
end

def word_sizes(string)
  hash

# LS Answer:

def word_sizes(words_string)
  counts = Hash.new(0) # initialize with default 0
  words_string.split.each do |word|
    counts[word.size] += 1 # increment hash by initializeing with default 0
  end
  counts
end

# LS Answer was my answer originaly but I could not get past the nil return.
# Now I see why and have added Initialize_Has_with_default_value to my Library.

# Examples

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# 12:46pm - 1:08pm (22 min)