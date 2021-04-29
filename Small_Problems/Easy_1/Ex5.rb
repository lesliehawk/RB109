# Reverse It (Pt 1)

# Write a method that takes one argument, a string,
# and returns a new string with the words in reverse order.

def reverse_sentence(sentence)
  p sentence   # String                         # "Hello World"
  p sentence.split  # Array                     # ["Hello", "World"]
  p sentence.split.reverse  # Array             # ["World", "Hello"]
  p sentence.split.reverse.join   # String      # "WorldHello"
  p sentence.split.reverse.join(' ')  # String  # "World Hello"
end

# Examples:

# puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'