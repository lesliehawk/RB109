# Sum or Product of Consecutive Integers

# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product of all numbers
# between 1 and the entered integer.

# Examples:

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.
number = 0
operation = ""

loop do
  puts "Please enter an integer greater than 0:"
  number = gets.chomp.to_i
  break if number > 0
  puts "Not a valid number."
end

loop do
  puts "Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp.downcase
  break if operation == "s" || operation == "p"
  puts "Not a valid choice."
end

case operation
when 's'
  puts "The sum of the integers between 1 and #{number} is #{(1..number).sum}."
when 'p'
  puts "The product of the integers between 1 and #{number} is #{(1..number).inject(:*)}."
else
  puts "Not a valid choice."
end
