# Leading Substrings
# Write a method that returns a list of all substrings of a string
# that start at the beginning of the original string.
# The return value should be arranged
# in order from shortest to longest substring.

def leading_substrings(str)
  substrings = []
  substrings << str
  substrings
end

p leading_substrings('abc') #== ['a', 'ab', 'abc']
p leading_substrings('a') #== ['a']
p leading_substrings('xyzzy') #== ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']