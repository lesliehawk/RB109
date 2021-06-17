# method that allows you to multiply every array item by a specified value

def multiply(numbers, multiple)
  numbers.map { |num| num * multiple }
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]