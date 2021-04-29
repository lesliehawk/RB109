# Stringy Strings

# Write a method that takes one arugment, a positive integer,
# and returns a string of alternating 1s and 0s,
# always starting with 1.
# The length fo the string should match the given interger.

def stringy(integer, start=1)
  tens = ''
  if start == 0
    (integer / 2).times { |_| tens << '01' }
    tens << '0' if integer.odd?
  else
    (integer / 2).times { |_| tens << '10' }
    tens << '1' if integer.odd?
  end
  tens
end

# def stringy(number, start = 1)
#   ''.rjust(number, (start == 1 ? '10' : '01'))
# end


# Examples:

puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'