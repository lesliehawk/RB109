# Can you implement a double_numbers! method that mutates its argument?

def double_numbers!(numbers)
  numbers.map { |num| num * 2 }
end

def double_odd_numbers(numbers)
  numbers.map { |num| num.odd? ? num * 2 : num }
end

p my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers!(my_numbers) # => [2, 8, 6, 14, 4, 12]

p my_numbers

# double the numbers that have odd indices
p double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]

# not mutated
p my_numbers                      # => [1, 4, 3, 7, 2, 6]