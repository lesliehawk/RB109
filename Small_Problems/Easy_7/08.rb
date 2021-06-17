# Multiply Lists
# Write a method that takes two Array arguments
# in which each Array contains a list of numbers,
# and returns a new Array
# that contains the product of each pair of numbers
# from the arguments that have the same index.
# You may assume that the arguments contain the same number of elements.

def multiply_list(arr1, arr2)
  products_arr = []
  idx = 0
  until idx >= arr1.length
    products_arr << arr1[idx] * arr2[idx]
    idx += 1
  end
  products_arr
end

# Further Exploration using #zip:
# def multiply_list(arr1, arr2)
#   arr1.zip(arr2).map { |a, b| a * b }
# end

# LS Answer: #each_with_index

# def multiply_list(list_1, list_2)
#   products = []
#   list_1.each_with_index do |item, index|
#     products << item * list_2[index]
#   end
#   products
# end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]