# Triangle Sides

# A triangle is classified as follows:

# equilateral: All 3 sides are of equal length
# isosceles: 2 sides are of equal length, while the 3rd is different
# scalene: All 3 sides are of different length

# To be a valid triangle, the sum of the lengths of the two shortest sides
# must be greater than the length of the longest side,
# and all sides must have lengths greater than 0:
# if either of these conditions is not satisfied, the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments,
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid
# depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

def valid_triangle(first, second, third)
  sides = [first, second, third].sort
  !sides.any?(0) && sides[0] + sides[1] > sides[2]
end

def triangle(first, second, third)
  return :invalid if !valid_triangle(first, second, third)
  unique_lengths = [first, second, third].uniq.length

  case unique_lengths
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  else :invalid
  end
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
