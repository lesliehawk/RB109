# Neutralizer

# We wrote a neutralize method that removes negative words from sentences.
# However, it fails to remove all of them. What exactly happens?

def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# #each iterates over each element by index. 'dull' is originally at index 1.
# When 'dull' is deleted, 'boring' moves to index 1.
# #each then iterates to the next index, index 2, which is now 'cards' and 'boring'
# is never available to pass to #negative? for evaluation.
# Therefore, it is not deleted from the array.