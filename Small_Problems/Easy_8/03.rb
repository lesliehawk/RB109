# Leading Substrings
# Write a method that returns a list of all substrings of a string
# that start at the beginning of the original string.
# The return value should be arranged
# in order from shortest to longest substring.

def leading_substrings(str)
  running_str = ''
  sub_strings = []
  str.each_char { |chr| sub_strings << running_str += chr }
  sub_strings
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

# LS Answer:
# def leading_substrings(string)
#   result = []
#   0.upto(string.size - 1) do |index|
#     result << string[0..index]
#   end
#   result
# end