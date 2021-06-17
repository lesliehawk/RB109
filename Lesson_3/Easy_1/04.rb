# The Ruby Array class has several methods for removing items from the array.
# Two of them have very similar names. Let's see how they differ:

# What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) # MTC
#=> 2
# Deletes the element at the specified index (index 1 in this case with a value of 2),
# returning that element (2),
# or nil if the index is out of range.
numbers
#=>  = [1, 3, 4, 5]

numbers = [1, 2, 3, 4, 5]
numbers.delete(1) # MTC
# 1
# Deletes all items from self that are equal to obj.
# Returns the last deleted item, or nil if no matching item is found.

numbers
#=> [2, 3, 4, 5]