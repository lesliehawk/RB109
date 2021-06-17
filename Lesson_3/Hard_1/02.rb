# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a] #informal_greeting points to the key to a:
informal_greeting << ' there' #<< muates the caller, greetings[:a] now evaluates to a value of 'hi there'

puts informal_greeting  #  => "hi there"
puts greetings
#=> { a: "hi there"}