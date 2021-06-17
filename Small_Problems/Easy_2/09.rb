# String Assignment
# Take a look at the following code:


name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# What does this code print out? Think about it for a moment before continuing.

# Alice
# Bob

# If you said that code printed

# Alice
# Bob
# you are 100% correct, and the answer should come as no surprise.

# Now, let's look at something a bit different:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
What does this print out? Can you explain these results?

# BOB
# BOB
# Both name and save_name point to the same address in memory where "Bob" is stored.
# When the value "Bob" gets modified in place with the mutating method upcase!
# the both variables are still pointing the same, now modified value and return "BOB"
# when puts is called on them.