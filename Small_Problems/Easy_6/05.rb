# Reversed Arrays (Part 2)
# Write a method that takes an Array,
# and returns a new Array
# with the elements of the original list in reverse order.
# Do not modify the original list.

# You may not use Array#reverse or Array#reverse!,
# nor may you use the method you wrote in the previous exercise.

def reverse(arr)
  new_arr = []
  index = -1
  until index < -arr.length
    new_arr << arr[index]
    index -= 1
  end
  new_arr
end

# LS Answer:

# reverse_each is like each,
# except it processes the elements in reverse order.
# Note that unlike each, reverse_each only applies to Arrays.

# def reverse(array)
#   result_array = []
#   array.reverse_each { |element| result_array << element }
#   result_array
# end

# Examples:

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true
p
p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true