# Parent Class

# Use irb to run the following code:

s = 'abc'
puts s.public_methods.inspect

# You should find that it prints a list of all of the
# public methods available to the String s;
# this includes not only those methods defined
# in the String class,
# but also methods that are inherited from Object
# (which inherits other methods from the BasicObject class
# and the Kernel module). That's a lot of methods.

# How would you modify this code to print just the public
# methods that are defined or overridden by the String class?

# That is, the list should exclude all members that are
# only defined in Object, BasicObject, and Kernel.

puts.s.public_methods(false).inspect

# ruby-doc > find #public_methods (Object) > read documentation:

# public_methods(all=true) → array
# Returns the list of public methods accessible to obj.
# If the all parameter is set to false, only those methods
# in the receiver will be listed.
# So only String methods will be listed, will exclude parent methods.