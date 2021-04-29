# Calculator.rb

puts "Enter a number:"
num1 = gets.chomp.to_i

puts "Enter another number:"
num2 = gets.chomp.to_i

puts "Do you want to add, subtract , mulitply or divide?"
puts "Enter +, -, *, or /:"
operation = gets.chomp

answer =  case operation
          when '+'
            num1 + num2
          when '-'
            num1 - num2
          when '*'
            num1 * num2
          when '/'
            num1.to_f / num2.to_f
          end

puts "#{num1} #{operation} #{num2} = #{answer}"

