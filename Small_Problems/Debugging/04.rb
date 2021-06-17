# Reverse Sentence
# The reverse_sentence method should return a new string
# with the words of its argument in reverse order,
# without using any of Ruby's built-in reverse methods.
# However, the code below raises an error.
# Change it so that it behaves as expected.


def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    # reversed_words = words[i] + reversed_words
    reversed_words.unshift(words[i])
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'

# Line 15 is trying to concatenate a string to the beginning of the reversed_words array.
# This throws a type error. In order to prepend the word string to the beginning of the array,
# unshift or prepend methods should be called on reversed_words with the words[i] string
# passed in as an argument.

# Or LS Answer: reversed_words = [words[i]] + reversed_words
# The words array could be called by adding brackets [words[i]] and then added
# to the reversed_words array.