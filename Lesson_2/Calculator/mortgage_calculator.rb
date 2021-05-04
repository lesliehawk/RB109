require "yaml"
MSG = YAML.load_file("mortgage_calc_messages.yml")

def clear_screen
  system('clear')
end

def prompt(message)
  puts(">> #{message}")
end

def comma_format_number(number) # inserts commas in long numbers
  number = number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  number << '0' if number[-2..-1] == ".0"
  number
end

def greeting
  prompt(MSG["greeting"])
  sleep(2)
end

def valid_positive_number?(input)
  input == input.to_i.to_s && input.to_i > 0
end

def get_loan_amount
  clear_screen
  loan_amount = ''
  loop do
    puts
    prompt(MSG["loan_amount"])
    loan_amount = gets.strip.chomp
    break if valid_decimal_number?(loan_amount)
    prompt(MSG["non_negative"])
  end
    loan_amount.to_f
end

def valid_decimal_number?(input)
  (input == input.to_i.to_s || input == input.to_f.to_s) && input.to_f >= 0
end

def get_apr
  clear_screen
  apr = ''
  loop do
    puts
    prompt(MSG["apr"])
    apr = gets.strip.chomp
    break if valid_decimal_number?(apr)
    prompt(MSG["non_negative"])
  end
  apr.to_f
end

def get_loan_duration
  clear_screen
  loan_period = ''
  loop do
    puts
    prompt(MSG["loan_duration"])
    loan_period = gets.strip.chomp
    break if valid_positive_number?(loan_period)
    prompt(MSG["positive_number"])
  end
  loan_period.to_i
end

def calculating_animation
  clear_screen
  puts
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

def monthly_amount(loan_amount, apr, loan_duration)
  monthly_interest_rate = apr / 100 / 12
  loan_duration_months = loan_duration * 12
  monthly_interest_rate == 0 ? (loan_amount / loan_duration_months).round(2) :
    (loan_amount * (monthly_interest_rate /
      (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))).round(2)
end

def display_loan_info(loan_amt, int_rate, loan_period, payment)
  clear_screen
  puts "----------------------------------------"
  prompt("Loan Amount: $#{comma_format_number(loan_amt)}")
  prompt("APR: #{int_rate.round(3)}%")
  prompt("Loan Duration: #{loan_period} years")
  puts "----------------------------------------"
  prompt("Monthly Payment: $#{comma_format_number(payment)}")
  puts
  sleep(2)
end

def go_again?
  prompt(MSG["another_calc"])
  input = ''
  loop do
    input = gets.strip.chomp.downcase
    break if ['yes', 'y', 'no', 'n'].include?(input)
    prompt(MSG["invalid_answer"])
  end
  input[0] == 'y'
end

def send_off
  clear_screen
  puts
  prompt(MSG["thank_you"])
  prompt(MSG["good_bye"])
  puts
end

clear_screen

greeting

loop do
  clear_screen

  loan_amount = get_loan_amount

  apr = get_apr

  loan_duration = get_loan_duration

  monthly_payment = monthly_amount(loan_amount, apr, loan_duration)

  calculating_animation

  display_loan_info(loan_amount, apr, loan_duration, monthly_payment)

  break unless go_again?

  clear_screen
end

send_off
