# 12:45pm - 12:57pm (12 min)

# Convert a String to a Signed Number!
# In the previous exercise, you developed a method
# that converts simple numeric strings to Integers.

# In this exercise, you're going to extend that method
# to work with signed numbers.

# Write a method that takes a String of digits,
# and returns the appropriate number as an integer.
# The String may have a leading + or - sign;

# if the first character is a +,
# your method should return a positive number;

# if it is a -, your method should return a negative number.

# If no sign is given, you should return a positive number.

# You may assume the string will always contain a valid number.

# You may not use any of the standard conversion methods available in Ruby,
# such as String#to_i, Integer(), etc.

# You may, however, use the string_to_integer method from the previous lesson.

NUM_HASH = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(str)
  running_total = 0
  numbers = str.chars
  loop do
    running_total += NUM_HASH[numbers[0]] * (10**(numbers.length - 1))
    numbers.shift
    break if numbers.empty?
  end
  running_total
end

def string_to_signed_integer(str)
  if str[0] == '-'
    str.delete!('-')
    string_to_integer(str) * -1
  elsif str[0] == '+'
    str.delete!('+')
    string_to_integer(str)
  else
    string_to_integer(str)
  end
end

# Really love Stephen Gontzes solution. So elegant.

# def string_to_signed_integer(str)
#   sign = str[0] == '-' ? -1 : 1
#   str = str.delete("+-")
#   string_to_integer(str) * sign
# end

# Examples

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100