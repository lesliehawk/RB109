# Alan wrote the following method, which was intended to
# show all of the factors of the input number:

# def factors(number)
#   divisor = number
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# end

# Alyssa noticed that this will fail if the input is 0, or a negative number,
# and asked Alan to change the loop.

# How can you make this work without using begin/end/until?

# Note that we're not looking to find the factors for 0 or negative numbers,
# but we just want to handle it gracefully instead of raising an exception
# or going into an infinite loop.

def factors(number)
  divisor = number
  factors = []
  loop do
    break if divisor <= 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# Bonus 1
# What is the purpose of the number % divisor == 0 ?

30 % 30 Remainder 0 because 30 is divisible by 30 with remainder 0, 30 is a factor of 30
30 % 29 Remainder 1
30 % 28 Remainder 2
30 % 16 Remainder 3
30 % 15 Remainder 0 because 30 is divisible by 15 with remainder 0, 15 is a factor of 30
30 % 3  Remainder 0 because 30 is divisible by  3 with remainder 0,  3 is a factor of 30

The conditions that return true (30, 15, ...3, etc)are appended to the factors array.
# LS Answer: Allos you to determine if the result of the division is an integer number (no remainder).

# Bonus 2
# What is the purpose of the second-to-last line (line 8) in the method
# (the factors before the method's end)?

The return of a method in ruby is always the last line executed.
If factors was not called the loop would be the last executed line
and the return would be nil.
Calling factors instead returns the array from the method call, the purpose of a method named factors.


