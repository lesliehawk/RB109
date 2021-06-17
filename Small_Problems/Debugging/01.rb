# Countdown
# Our countdown to launch isn't behaving as expected. Why?
# Change the code so that our program successfully counts down from 10 to 1.

# def decrease(counter)
#   counter -= 1
# end

counter = 10

10.times do
  puts counter
  # decrease(counter)
  counter -= 1
end

puts 'LAUNCH!'

# The program only prints 10 instead of 10, 9, 8... because the incrementer
# counter -= 1 is in a method definition. Method defs create their own scope,
# as well as reassignment is not a mutating method, and therefore does not change
# the counter variable outside the method def. Therefore, the counter variable
# insdied the decrease method def is variable shadowing. Moving counter -= 1
# inside the times scope and replacing decrease(counter),
# corrects the issue and the program works correctly.