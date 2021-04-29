# Mortgage Calculator

def prompt(message)
  puts(">> #{message}")
end

def comma_format_number(number) # to insert commas in numbers
  number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
end

# I tried to refactor this logic into a loop,
# but the loop/until/times/etc. loops I tried broke the feature
# so I kept the more verbose logic.
def calculating
  sleep(0.2)
  print "\r" + "Calculating."
  sleep(0.4)
  print "\r" + "Calculating.."
  sleep(0.4)
  print "\r" + "Calculating..."
  sleep(0.4)
  print "\r" + "Calculating...."
  sleep(0.4)
end

loop do
  puts
  prompt("Welcome to Mortgage Calculator! <<")
  puts
  prompt("What is the mortgage amount?")

  loan_amount = ''
  loop do
    loan_amount = gets.chomp.to_i
    if loan_amount <= 0
      prompt("Please enter a valid number.")
    else
      break
    end
  end

  prompt("What is the Annual Percentage Rate?")

  apr = ''
  loop do
    apr = gets.chomp.to_f
    if apr <= 0
      prompt("Please enter a positive number.")
    else
      break
    end
  end

  prompt("What is the mortgage period (years)?")

  loan_duration = ''
  loop do
    loan_duration = gets.chomp.to_i
    if loan_duration <= 0
      prompt("Please enter a positive whole number.")
    else
      break
    end
  end

  monthly_interest_rate = apr / 100 / 12

  loan_duration_months = loan_duration * 12

  monthly_payment = loan_amount * (monthly_interest_rate /
    (1 - (1 + monthly_interest_rate)**(-loan_duration_months))).to_f.round(2)

  calculating

  puts
  puts "----------------------------------------"
  prompt("Loan Amount: $#{comma_format_number(loan_amount)}")
  prompt("APR: #{apr.round(3)}%")
  prompt("Loan Duration: #{loan_duration} years")
  puts "----------------------------------------"
  prompt("Monthly Payment: $#{comma_format_number(monthly_payment)}")
  puts

  prompt("Calculate another mortgage? (Y/N)")
  answer = gets.chomp.downcase

  break unless answer.start_with?('y')
end

prompt("Thank you for using Mortgage Calculator!")
puts
prompt("Good bye!")
puts
