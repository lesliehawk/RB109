# Word to Digit

# Write a method that takes a sentence string as input,
# and returns the same string with any sequence of the words
# 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'
# converted to a string of digits.

# Example:

NUMBERS_HSH = {'zero'=>'0', 'one'=>'1', 'two'=>'2', 'three'=>'3', 'four'=>'4', 'five'=>'5', 'six'=>'6', 'seven'=>'7', 'eight'=>'8', 'nine'=>'9'}

def word_to_digit(str)
  # str.split.map { |word| NUM_WORDS.include?(word) ? NUMBERS_HSH[word] : word }.join(' ') #'four.' is a problem
  NUMBERS_HSH.keys.each do |word|
    str.gsub!(/\b#{word}\b/, NUMBERS_HSH[word])
  end
  str
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.')
# == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

