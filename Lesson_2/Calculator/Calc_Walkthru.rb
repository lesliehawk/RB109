# Calculator Walk Thru

# asks for two numbers
# asks for the type of operation to perform:
# add, subtract, multiply or divide
# displays the result

puts "Welcome Calculator"

puts "What's the first number?"
number1 = gets.chomp

puts "What's the second number?"
number2 = gets.chomp

puts "What operation would you lie to perform? 1) add 2) subtract 3) multiply 4) divide"
operator = gets.chomp

if operator == '1'
  result = number1.to_i + number2.to_i
elsif operator == '2'
  result = number1.to_i - number2.to_i
elsif operator == '3'
  result = number1.to_i * number2.to_i
else operator == '4'
  result = number1.to_f / number2.to_f
end

puts("The result is #{result}")