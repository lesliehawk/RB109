# Convert a Signed Number to a String!
# In the previous exercise, you developed a method that converts
# non-negative numbers to strings.
# In this exercise, you're going to extend that method
# by adding the ability to represent negative numbers as well.

# Write a method that takes an integer,
# and converts it to a string representation.

# You may not use any of the standard conversion methods available in Ruby,
# such as Integer#to_s, String(), Kernel#format, etc.
# You may, however, use integer_to_string from the previous exercise.

NUMBER_INDEX = %w(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(num)
  str_number = ''
  index_arr = []
  loop do
    index_arr.unshift(num % 10)
    num /= 10
    break if num <= 0
  end
  index_arr.each { |num| str_number << NUMBER_INDEX[num] }
  p str_number
end

def signed_integer_to_string(num)
  sign = num.positive? ? "+" : '-'
  sign = '' if num.zero?
  num *= -1 if sign == '-'
  p "#{sign}#{integer_to_string(num)}"
end

# LS Answer
# def signed_integer_to_string(number)
#   case number <=> 0
#   when -1 then "-#{integer_to_string(-number)}"
#   when +1 then "+#{integer_to_string(number)}"
#   else         integer_to_string(number)
#   end
# end


# number <=> 0 ; this is ruby's "spaceship" operator.
# It compares the left side against the right side,
# then returns +1 if the left side is greater than the right,
# -1 if the left side is smaller than the right,
# and 0 if the values are the same.
# This is often useful when you need to know whether a number is
# positive, negative, or zero.

# Examples

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

# 1:17pm - 1:37pm (20 min)