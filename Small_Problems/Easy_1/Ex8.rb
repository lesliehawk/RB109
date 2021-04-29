# Array Average

# Write a method that takes one argument, an array of integers,
# and returns the average of all numbers in the array.
# The array will never be empty and the numbers will always be positive integers.
# Your result should also be an integer.

# def average(arr)
#   total = 0
#   arr.each { |num| total += num }
#   total / arr.length
# end

def average(arr)
# total = arr.inject { |sum, number| sum + number }
# total = arr.inject(:+)
# total.to_f / arr.length
  arr.sum.to_f / arr.length
end


# Examples:

puts average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) #== 25
puts average([9, 47, 23, 95, 16, 52]) #== 40