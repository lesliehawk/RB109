# Pseudo Code

# Write small pseudo code and translate into actual code.
# Verify the pseudo code logic as you go, otheriwse any
# incorrect logic will ripple over the whole program ,
# forcing you to start over again and again.

# Remember, psuedo code is a guess at the solution.
# No need to write the whole program in pseudo code at once.

# Verify and test as you go.

# For example, write out pseudo-code (both casual and formal)
# that does the following:

# 1. a method that returns the sum of two integers

# DEFINE method sum
#   PRINT message: "Enter a number:"
#   SET number1 = user input

#   PRINT message: "Enter another number"
#   SET number2 = user 2nd input

#   SET result = number1 to Integer + number2 to Integer
#   PRINT message:  "The sum of your numbers is #{result}"
# END method definition

# def sum
#   puts "Enter a number:"
#   number1 = gets.chomp

#   puts "Enter another number:"
#   number2 = gets.chomp

#   sum = number1.to_i + number2.to_i
#   puts "#{number1} + #{number2} = #{sum}"
# end

# sum

# 2. a method that takes an array of strings,
# and returns a string that is all those strings concatenated together

# DEFINE method array_to_string(array)
#   SET string variable
#   LOOP
#     REMOVE first element of array
#     ADD element to end of string
#     BREAK out of loop IF array is empty
#     OTHERWISE ADD " "
#   END LOOP

#   RETURN string
# END method definition

# def array_to_string(array)
#   string = ''
#   loop do
#     string << array.shift
#     break if array.empty?
#     string << ' '
#   end
#   string
# end

# puts array_to_string(["Bentley", "the", "wonder", "dog!"])

# 3. a method that takes an array of integers,
# and returns a new array with every other element

# DEFINE method odd_numbers(array of integers)
#   ITERATE thru array
#   SELECT each element that % 2 != 0
#   ADD SELECTED element to new_arr
#   RETURN new_arr
# END method definition

def odd_number(array)
  array.select { |num| num % 2 != 0 }
end

p odd_number([1, 2, 3, 4, 5, 6, 7])


