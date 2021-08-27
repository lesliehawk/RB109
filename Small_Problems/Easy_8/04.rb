# All Substrings
# Write a method that returns a list of all substrings of a string.
# The returned list should be ordered
# by where in the string the substring begins.
# This means that all substrings that start at position 0 should come first,
# then all substrings that start at position 1, and so on.
# Since multiple substrings will occur at each position,
# the substrings at a given position
# should be returned in order from shortest to longest.

# You may (and should) use the leading_substrings method you wrote in the previous exercise:

def leading_substrings(str)
  running_str = ''
  sub_strings = []
  str.each_char { |chr| sub_strings << running_str += chr }
  sub_strings
end

def substrings(str)
  str_arr = []
  until str.empty?
    str_arr << leading_substrings(str)
    str.slice!(0)
  end
  str_arr.flatten
end


p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]