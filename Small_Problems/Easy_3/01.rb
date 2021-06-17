# Searching 101
# Write a program that solicits 6 numbers from the user,
# then prints a message that describes whether or not the
# 6th number appears amongst the first 5 numbers.

# Examples:

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].

# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].

def appears_or_not(arr, num)
  arr[0, 4].include?(num) ? "appears" : "does not appear"
end

places = ['1st', '2nd', '3rd', '4th', 'last']
counter = 0
numbers = []
number = nil

loop do
  loop do
    puts "Enter the #{places[counter]} number:"
    number = gets.chomp.to_i
    break if number > 0
    puts "Not a valid number."
  end

  numbers << number

  counter += 1

  break if counter >= places.size

end

puts "The number #{numbers.last} #{appears_or_not(numbers, number)} in #{numbers[0, 4]}."
