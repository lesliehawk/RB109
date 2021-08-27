# Getting Things Done

# We wrote a method for moving a given number of elements from one array to another.
# We decide to test it on our todo list, but invoking move on line 11 results
# in a SystemStackError. What does this error mean and why does it happen?

# A recursive method needs a terminating condition or it will continue forever or overflow the system stack.

Copy Code
def move(n, from_array, to_array)
  to_array << from_array.shift
  return if n == 1 # terminating condition (like a loop's break statement)
  move(n - 1, from_array, to_array)
end
F
# urther Exploration: What happens if the length of the from_array is smaller than n?

Copy Code
todo = ['coffee with Tom']
done = ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

move(2, todo, done)

p todo # []
p done # ["apply sunscreen", "go to the beach", "study", "walk the dog", "coffee with Tom", nil]

# The from_array is emptied, a nil is therefore returned and appended to to_array when #shift is called on from_array .
