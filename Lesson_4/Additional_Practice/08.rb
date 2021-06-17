# What happens when we modify an array while we are iterating over it?
# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# 1 gets printed removed from 0 index
# numbers shift left
# program moves to 1 index, which is now 3
# 3 gets printed and removed
# numbers shift left
# program moves to 2 index, which is now out of bounds
# block ends
# each returns original (now mutated) array
#=> [3, 4]

# What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# 1 is printed
# 4 gets removed
# 2 is printed
# 3 gets removed
# block ends
#=> [1, 2] is returned by each
