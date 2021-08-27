# What's wrong with the output?

# Josh wants to print an array of numeric strings in reverse numerical order.
# However, the output is wrong.
# Without removing any code, help Josh get the expected output.

arr = ["9", "8", "7", "10", "11"]
# p (arr.sort do |x, y|
#     y.to_i <=> x.to_i
#   end)
#or
p arr.sort { |x, y| y.to_i <=> x.to_i }


# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]

# when you use do...end block, p and arr.sort bind more tightly
# due to Ruby's precedence rules,
# so you are passing the block to the return value of p arr.sort.
# It's as though you wrote:

# (p arr.sort) do |x,y|
#   y.to_i <=> x.to_i
# end

# https://ruby-doc.org/core-2.7.2/doc/syntax/precedence_rdoc.html
# states:
# { ... } blocks have priority below all listed operations,
# but do ... end blocks have lower priority.
