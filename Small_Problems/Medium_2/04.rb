# Matching Parentheses?

# Write a method that takes a string as an argument, and
# returns true if all parentheses in the string are properly balanced,
# false otherwise.

# To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

# Note that balanced pairs must each start with a (, not a ).

def balanced?(str, start, close)
  arr = str.chars
  arr.select! { |chr| chr == start || chr == close }
  return false if arr.first == close || arr.last == start
  arr.count(start) == arr.count(close) ? true : false
end


# puts balanced?('What (is) this?') == true
# puts balanced?('What is) this?') == false
# puts balanced?('What (is this?') == false
# puts balanced?('((What) (is this))?') == true
# puts balanced?('((What)) (is this))?') == false
# puts balanced?('Hey!') == true
# puts balanced?(')Hey!(') == false

puts balanced?('What ((is))) up(', '(', ')') == false
puts balanced?('[[What]] [is this]]?', '[', ']') == false
puts balanced?('}Hey!{', '{', '}') == false

