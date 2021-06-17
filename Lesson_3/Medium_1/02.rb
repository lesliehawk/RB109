# The result of the following statement will be an error:

# Why is this and what are two possible ways to fix this?

puts "the value of 40 + 2 is " + (40 + 2)

# Cannot combine string with integer error

# "TypeError (no implicit conversion of Integer into String)"

# Fixes
puts "the value of 40 + 2 is #{(40 + 2)}"
puts "the value of 40 + 2 is " + (40 + 2).to_s