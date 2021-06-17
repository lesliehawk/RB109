# Practice Problem 13
# Given the following data structure,
# return a new array containing the same sub-arrays as the original
# but ordered logically by only taking into consideration
# the odd numbers they contain.


arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

sorted_arr = arr.sort_by do |subarr|
  subarr.select do |elem|
    elem.odd?
  end
end

p sorted_arr

# The sorted array should look like this:
# [[1, 8, 3], [1, 6, 7], [1, 4, 9]]