# Fibonacci Numbers (Last Digit)

# In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.


def fibonacci(n)
  f = [0, 1]
  (n-1).times { |_| f << f[-1] + f[-2]}
  f.last
end

def fibonacci_last(num)
  fibonacci(num).to_s[-1].to_i
end

# LS Answer:

# def fibonacci_last(nth)
#   last_2 = [1, 1]
#   3.upto(nth) do
#     last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
#   end

#   last_2.last
# end

puts fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
puts fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
puts fibonacci_last(123456789) # -> 4

