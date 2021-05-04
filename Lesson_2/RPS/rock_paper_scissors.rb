# require "yaml"
# MSG = YAML.load_file("mortgage_calc_messages.yml")

VALID_CHOICES = {'rock' => 'r', 'paper' => 'p', 'scissors' => 'sc', 'lizard' => 'l', 'spock' => 'sp'}
WINNING_COMBOS = {
  'rock'     => ['lizard',  'scissors'],
  'paper'    => ['rock',    'spock'],
  'scissors' => ['lizard',  'paper'],
  'lizard'   => ['paper',   'spock'],
  'spock'    => ['rock',    'scissors']
}
SCOREBOARD = {player: 0, computer: 0}

def clear_screen
  system('clear')
end

def prompt(message)
  puts ">> #{message}"
end

def greeting
  prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock! <<")
  prompt("Get 5 Point to Win the Match!")
end

def get_choice
  choice = ''
  prompt("Choose one: #{VALID_CHOICES.keys.join(', ')}")
  loop do
    prompt("Enter your choice: #{VALID_CHOICES.values.join(', ')}")
    choice = gets.chomp.downcase
    choice = VALID_CHOICES.key(choice)
    VALID_CHOICES.key?(choice) ? break : prompt("That's not a valid choice.")
  end
  choice
end

def display_choices(choice, computer_choice)
  prompt("You chose:      #{choice.capitalize}")
  prompt("Computer chose: #{computer_choice.capitalize}")
end

def win?(first, second)
  WINNING_COMBOS[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt('YOU WON!')
    :player
  elsif win?(computer, player)
    prompt("COMPUTER WON!")
    :computer
  else
    prompt("It's a tie!")
  end
end

def increment_score(result)
  result == nil ? SCOREBOARD : SCOREBOARD[result] += 1
end

def display_scoreboard
  puts
  p "************SCOREBOARD*************"
  puts
  prompt("Player:   #{SCOREBOARD[:player]}")
  prompt("Computer: #{SCOREBOARD[:computer]}")
  puts
  p "***********************************"
  puts
end

def display_match_winner
  p "-----------------------------------"
  prompt("MATCH POINTS:")
  prompt("#{SCOREBOARD.key(5).to_s.capitalize} won!")
  p "-----------------------------------"
end

def match_over?
  SCOREBOARD.values.include?(5)
end

def play_again?
  prompt("Want to play another match?")
  input = ''
  loop do
    input = gets.chomp.downcase
    break if ['yes', 'y', 'no', 'n'].include?(input)
    prompt("Invalid answer. Please put yes or no (Y/N).")
  end
  input[0] == 'y'
end

def send_off
  prompt("Thank you for playing Rock, Paper, Scissors, Lizard, Spock!")
  prompt("Good bye!")
end


clear_screen

greeting

loop do
  clear_screen

  loop do
    choice = get_choice

    clear_screen

    computer_choice = VALID_CHOICES.keys.sample

    display_choices(choice, computer_choice)

    result = display_results(choice, computer_choice)

    increment_score(result)

    display_scoreboard

    break if match_over?
  end

  clear_screen

  display_scoreboard

  display_match_winner

  break unless play_again?
end

send_off
