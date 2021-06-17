# The End Is Near But Not Here
# Write a method that returns the next to last word
# in the String passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

def penultimate(str)
  p str.split[-2]
end

def middle_word(str)
  size = str.split.length
  if size.even? || size == 0
    puts "Error: No middle word"
  else
    puts str.split[(size / 2)]
  end
end

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

middle_word('last word') == 'last'
middle_word('Launch School is great!') == 'is'
middle_word("")
middle_word("Launch School is the best and hardest.")