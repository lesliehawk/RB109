[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]

# The each method is called to iterate through the on the array collection [[1, 2], [3, 4]].
# Each elem of the array collection [[1, 2], [3, 4]] is passed as an argument to the method and assigned to the paramater arr.
# The first method is called on arr, which is [1, 2], which the first elem of arr, which is the Integer 1.
# The puts method is called with arr.first as its argument, which outputs the string value of 1 to the screen.
# The each method moves on and outputs 3, the first elem of the next and last elem of [[1, 2], [3, 4]], [3, 4].
# The return value of the block is nil as a the last returned value was nil from puts.
# Each however does not return the value of the block, and returns the original array.
