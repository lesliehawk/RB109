# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator.
# A user passes in two numbers, and the calculator will keep computing the sequence
# until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it,
# he got an error. Something about the limit variable. What's wrong with the code?


limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# limit is assigned outside the method, therefore the method call to limit will throw an error,
# as method definitions have their own scope and cannot access variables outside the method,
# the variable must be passed in as an argument.

# How would you fix this so that it works?

# To resolve this, limit could be inserted into the fib method def, or passed in as an argument



def fib(first_num, second_num)
  limit = 15
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# or



def fib(first_num, second_num, limit_num)
  while first_num + second_num < limit_num
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

limit = 15
result = fib(0, 1, limit)
puts "result is #{result}"



