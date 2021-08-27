# Diamonds!
# Write a method that displays a 4-pointed diamond in an n x n grid,
# where n is an odd integer that is supplied as an argument to the method.
# You may assume that the argument will always be an odd integer.

# Examples:


def diamond(n)
  1.upto(n-1) { |i| puts ("*" * i).center(n) if i.odd? }
  n.downto(1) { |i| puts ("*" * i).center(n) if i.odd? }
end


diamond(1)
# # *

diamond(3)
# #  *
# # ***
# #  *

diamond(9)
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

diamond(57)