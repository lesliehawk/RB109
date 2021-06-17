# Letter Swap
# Given a string of words separated by spaces,
# write a method that takes this string of words
# and returns a string in which the first
# and last letters of every word are swapped.

# You may assume that every word contains at least one letter,
# and that the string will always contain at least one word.
# You may also assume that each string contains nothing but words and spaces

def swap(string)
  arr = string.split(' ')

  arr.map! do |word|
    first = word[0]
    word[0] = word[-1]
    word[-1] = first
    word
  end

  arr.join(' ')
end

# LS Answer same except they use
# word[0], word[-1] = word[-1], word[0] to swap characters

# Examples:

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# 12:04 - 12:14 (10 min)
