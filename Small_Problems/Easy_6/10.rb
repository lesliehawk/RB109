# Right Triangles
# Write a method that takes a positive integer, n, as an argument,
# and displays a right triangle whose sides each have n stars.
# The hypotenuse of the triangle (the diagonal side in the images below)
# should have one end at the lower-left of the triangle,
# and the other end at the upper-right.

def triangle(num)
  star_count = 0
  while star_count < num
    star_count += 1
    stars = "*" * star_count
    puts stars.rjust(num)
  end
end


triangle(5)

#     *
#    **
#   ***
#  ****
# *****

triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********