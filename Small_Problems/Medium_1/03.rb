# Rotation (Part 3)
# If you take a number like 735291, and rotate it to the left, you get 352917.
# If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175.
# Keep the first 2 digits fixed in place and rotate again to 321759.
# Keep the first 3 digits fixed in place and rotate again to get 321597.
# Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579.
# The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument,
# and returns the maximum rotation of that argument.
# You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

# Note that you do not have to handle multiple 0s.

def rotate_array(arr)
  new_arr = arr.dup
  last = new_arr.shift
  new_arr << last
end

def rotate_integers(numbers)
  rotate_array(numbers.to_s.chars).join
end

def rotate_rightmost_digits(int, num)
  first = int.to_s.chars[0...-num].join
  last = int.to_s.chars[-num..-1].join
  (first + rotate_integers(last)).to_i
end

# I got close to this answer... but could not accomplish it.
# Return to try again later.

# LS ANSWER:

# def max_rotation(number)
#   number_digits = number.to_s.size
#   number_digits.downto(2) do |n|
#     number = rotate_rightmost_digits(number, n)
#   end
#   number
# end

puts max_rotation(735291) #== 321579
puts max_rotation(3) #== 3
puts max_rotation(35) #== 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845
