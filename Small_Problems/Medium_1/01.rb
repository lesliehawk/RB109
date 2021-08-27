# Rotation (Part 1)

# Write a method that rotates an array 
# by moving the first element to the end of the array. 
# The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

def rotate_array(arr)
	new_arr = arr.dup
	last = new_arr.shift
	new_arr << last
end

def rotate_string(str)
	rotate_array(str.chars).join
end

def rotate_integers(numbers)
	rotate_array(numbers.to_s.chars).join
end

# LS Answer
# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

p rotate_string("string")
p rotate_integers(1234)