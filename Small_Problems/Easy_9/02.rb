# Double Doubles

# A double number is a number with an even number of digits 
# whose left-side digits are exactly the same as its right-side digits. 
# For example, 44, 3333, 103103, 7676 are all double numbers. 
# 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, 
# unless the argument is a double number; 
# double numbers should be returned as-is.

def double_number?(num)
	str_num = num.to_s
	num_length = str_num.length
	if num_length.even?
		once_length = num_length / 2
		once = str_num[0, once_length]
		twice = once * 2
		twice.to_i == num
	end
end

def twice(num)
	double_number?(num) ? num : num * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10
