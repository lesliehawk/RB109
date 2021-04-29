# Calc_Bonus.rb

# asks for two numbers
# asks for the type of operation to perform:
# add, subtract, multiply or divide
# displays the result

require "yaml"
MESSAGES = YAML.load_file("calculator_messages.yml")
# puts MESSAGES.inspect

def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input # inputs '0' to.i (verifying it is an integer otherwise, error, back to string '0' == input of '0'
end

def float?(input)
  input.to_f.to_s == input
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def no_floating_zero?(input)
  input.include?('.')
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multipying'
  when '4'
    'Dividing'
  end
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''

  loop do
    prompt(MESSAGES['first_number'])
    number1 = gets.chomp
    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['not_valid'])
      if no_floating_zero?(number1)
        prompt(MESSAGES['add_floating_zero'])
      end
    end
  end

  number2 = ''

  loop do
    prompt(MESSAGES['second_number'])
    number2 = gets.chomp
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['not_valid'])
      if no_floating_zero?(number2)
        prompt(MESSAGES['add_floating_zero'])
      end
    end
  end

  # operator_prompt = <<-MSG
  #   What operation would you lie to perform?
  #   1) add
  #   2) subtract
  #   3) multiply
  #   4) divide
  # MSG

  prompt(MESSAGES['operator_prompt'])

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['choose_option'])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when '1'
              number1.to_f + number2.to_f
            when '2'
              number1.to_f - number2.to_f
            when '3'
              number1.to_f * number2.to_f
            when '4'
              number1.to_f / number2.to_f
            end

  prompt("The result is #{result}")
  prompt(MESSAGES['perform_another_calc'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['thank_you'])
