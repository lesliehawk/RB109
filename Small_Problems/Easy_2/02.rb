# How big is the room?

# Build a program that asks a user for the length and width
# of a room in meters
# and then displays the aread of the room in both
# square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Don't worry about validating input.

# Example:
# Enter the length of the room in meters:
# 10
# Enter the width of the room in meters:
# 7
# The area of the room is 70.0 square meters (753.47 square feet).


puts "Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

puts "The area of the room is #{length * width} square meters (#{(length * width * 10.7639).round(2)} square feet)."
