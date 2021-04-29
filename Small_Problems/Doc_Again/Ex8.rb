# Included Modules

# Use irb to run the following code:

a = [5, 9, 3, 11]
puts a.min

# Find the documentation for the #min method
# and change the above code to print the
# two smallest values in the Array.

# First, tested method with arugment (2), outputed lowest two elements.
puts a.min(2)
#=> [3, 5]

# Researched ruby-docs >> find .min >> Enumerable
# Array has Enumerable in its Included Modules,
# which allows methods from Enumerable to 'mix in'
# though they are not inherited as from a Parent class.