# Multiply All Pairs
# Write a method that takes two Array arguments
# in which each Array contains a list of numbers,
# and returns a new Array that contains the product of every pair of numbers
# that can be formed between the elements of the two Arrays.
# The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

def multiply_all_pairs(arr1, arr2)
  pairs_arr = arr1.product(arr2)
  products = pairs_arr.map do |pairs|
    pairs[0] * pairs[1]
  end
  products.sort
end

# Refactored:

# def multiply_all_pairs(arr1, arr2)
#   arr1.product(arr2).map { |n1, n2| n1 * n2 }.sort
# end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]