# Rotation (Part 2)

# Write a method that can rotate the last n digits of a number.

# Note that rotating just 1 digit results in the original number being returned.

# You may use the rotate_array method from the previous exercise if you want. (Recommended!)

# You may assume that n is always a positive integer. 


def rotate_array(arr)
	new_arr = arr.dup
	last = new_arr.shift
	new_arr << last
end

def rotate_integers(numbers)
	rotate_array(numbers.to_s.chars).join
end

def rotate_rightmost_digits(int, num)
	first = int.to_s.chars[0...-num].join
	last = int.to_s.chars[-num..-1].join
	(first + rotate_integers(last)).to_i
end

# LS Answer: refactor of my answer

# def rotate_rightmost_digits(number, n)
#   all_digits = number.to_s.chars
#   all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
#   all_digits.join.to_i
# end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917