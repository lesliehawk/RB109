# Fibonacci Numbers (Procedural)

# Rewrite your recursive fibonacci method so that it computes its results without recursion.
def fibonacci(n)
  f = [0, 1]
  (n-1).times { |_| f << f[-1] + f[-2]}
  f.last
end

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(4) == 3
puts fibonacci(5) == 5
puts fibonacci(12) == 144
puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
puts fibonacci(100_001) # => 4202692702.....8285979669707537501