# Reversed Arrays (Part 1)
# Write a method that takes an Array as an argument,
# and reverses its elements in place;
# that is, mutate the Array passed into this method.

# The return value should be the same Array object.

# You may not use Array#reverse or Array#reverse!.

def reverse!(arr)
  arr.length.even? ? counter = (arr.length / 2) : counter = ((arr.length + 1) / 2)
  a = 0
  b = -1
  until counter == 0
    hold = arr[a]
    arr[a] = arr[b]
    arr[b] = hold
    a += 1
    b += -1
    counter -= 1
  end
  arr
end

# LS Answer: with parralell assignment

# def reverse!(array)
#   left_index = 0
#   right_index = -1

#   while left_index < array.size / 2
#     array[left_index], array[right_index] = array[right_index], array[left_index]
#     left_index += 1
#     right_index -= 1
#   end

#   array
# end

# Parallel Assignment on line 32;
# a Ruby idiom for exchanging two values without requiring
# an intermediate variable. It's a handy idiom to remember.

# Examples:

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true
p
p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true
p
p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true
p
p list = []
p reverse!(list) == [] # true
p list == [] # true

# Note: for the test case list = ['abc'],
# we want to reverse the elements in the array.
# The array only has one element, a String,
# but we're not reversing the String itself,
# so the reverse! method call should return ['abc'].

