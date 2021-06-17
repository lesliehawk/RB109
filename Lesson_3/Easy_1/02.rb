# Describe the difference between ! and ? in Ruby.
# And explain what would happen in the following scenarios:

! bang operator
! can indicate that the method mutates the caller when placed at the end of a method name
! 'not' when used in a conditional

? can indicate method returns true or false when placed at the end of a method name
? also is part of a ternerary operator syntax

# what is != and where should you use it?
"does not equal"; used in conditional statements

# put ! before something, like !user_name
"not user_name"; use to return false

# put ! after something, like words.uniq!
can indicate that the method mutates the caller when placed at the end of a method name

# put ? before something
part of a ternerary operator syntax; statement ? true : false

# put ? after something
can indicate method returns true or false when placed at the end of a method name

# put !! before something, like !!user_name
"not not user_name"; use to return true