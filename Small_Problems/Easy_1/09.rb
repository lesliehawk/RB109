# Sum of Digits

# Write a method that takes one argument, a postive integer,
# and returns the sum of its digits.

# For a challenge, try writing this without any basic looping
# constructs (while, until, loop, and each).

# given an integer
# convert integer to string #to_s
# take each string character and convert to array elem #chars
# convert each string elem to an integer #map(to_i)
# iterate through each integer elem # inject(:+)
#   assign each integer value to a total
#   adding the next integer to the total
#   until each elem has been iterated through
# return the total # return value of inject(:+)

def sum(number)
  number.to_s.chars.map(&:to_i).inject(:+)
end

# Examples:

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45