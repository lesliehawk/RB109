# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8  # reassignment, not mutating #=> 50
end

new_answer = mess_with_it(answer) #=> 50
# 42 passed into messed_with_it
# 42 is assigned to some_number
# += assignment operator adds 8 to some_number
# some_number is returned, but answer is not mutated
# method returns 50
p answer - 8
#=> returns 34