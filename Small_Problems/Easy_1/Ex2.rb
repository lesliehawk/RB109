# Odd

# Write a method that takes one integer argument,
# which may be positive, negative or zero.
# Method returns true if the number's absolute value is odd.
# Assume the argument is a valid integer value.
# Keep in mind that you're not allowed to use #odd? or #even? in your solution.

# def is_odd?(num)
#  num.abs % 2 != 0
# end

# Rewrite #is_odd? to use Integer#remainder instead of %

def is_odd?(num)
 num.remainder(2) != 0
end

# Examples:

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true