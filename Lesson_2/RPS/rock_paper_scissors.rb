VALID_CHOICES = {
  'rock' => 'r',
  'paper' => 'p',
  'scissors' => 'sc',
  'lizard' => 'l',
  'spock' => 'sp'
}

WINNING_COMBOS = {
  'rock' => ['lizard', 'scissors'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['lizard', 'paper'],
  'lizard' => ['paper', 'spock'],
  'spock' => ['rock', 'scissors']
}

POINTS_TO_WIN = 5

def clear_screen
  system('clear')
end

def prompt(message)
  puts ">> #{message}"
end

def display_greeting
  puts "*** Welcome to Rock, Paper, Scissors, Lizard, Spock! ***"
  puts
end

def display_instructions
  prompt("Here are the rules:")
  puts
  puts <<-MSG
    Scissors cuts Paper,          Scissors decapitates Lizard,
    Paper covers Rock,            Lizard eats Paper,
    Rock crushes Lizard,          Paper disproves Spock,
    Lizard poisons Spock,         Spock vaporizes Rock,
    Spock smashes Scissors,       Rock crushes Scissors.
    MSG
  puts
  prompt("Get #{POINTS_TO_WIN} Points to Win the Match!")
end

def ready?
  puts
  prompt("Ready to shoot? (Y/N)")
  input = ''
  loop do
    input = gets.strip.chomp.downcase
    break if ['yes', 'y', 'no', 'n'].include?(input)
    prompt("Invalid answer. Please enter Y or N.")
  end
  input[0] == 'y'
end

def get_player_choice
  choice = ''
  prompt("Choose one: #{VALID_CHOICES.keys.join(', ')}")
  loop do
    prompt("Enter your choice: #{VALID_CHOICES.values.join(', ')}")
    choice = gets.strip.chomp.downcase
    choice = VALID_CHOICES.key(choice)
    VALID_CHOICES.key?(choice) ? break : prompt("That's not a valid choice.")
  end
  choice
end

def get_computer_choice
  VALID_CHOICES.keys.sample
end

def display_choices(choice, computer_choice)
  prompt("You chose:      #{choice.capitalize}")
  sleep(0.8)
  prompt("Computer chose: #{computer_choice.capitalize}")
  sleep(0.7)
end

def win?(first, second)
  WINNING_COMBOS[first].include?(second)
end

def determine_round_result(player, computer)
  if win?(player, computer)
    :player
  elsif win?(computer, player)
    :computer
  else
    :tie
  end
end

def display_round_result(winner, round_number)
  case winner
  when :player
    puts
    prompt("YOU win round #{round_number}!")
  when :computer
    puts
    prompt("COMPUTER wins round #{round_number}!")
  when :tie
    puts
    prompt("Round #{round_number} is a tie!")
  end
end

def increment_score(result, scorebrd)
  result == :tie ? scorebrd : scorebrd[result] += 1
end

def display_scoreboard(scorebrd)
  puts
  puts " *********SCOREBOARD*********"
  puts " |                          |"
  puts " |       Player:   #{scorebrd[:player]}        |"
  puts " |       Computer: #{scorebrd[:computer]}        |"
  puts " |                          |"
  puts " ****************************"
  puts
end

def display_match_winner(scorebrd)
  puts
  puts "*** #{scorebrd.key(POINTS_TO_WIN).to_s.upcase} wins the match!!! ***"
  puts
end

def match_over?(scorebrd)
  scorebrd.values.include?(POINTS_TO_WIN)
end

def play_again?
  prompt("Want to play another match?")
  input = ''
  loop do
    input = gets.strip.chomp.downcase
    break if ['yes', 'y', 'no', 'n'].include?(input)
    prompt("Invalid answer. Please put yes or no (Y/N).")
  end
  input[0] == 'y'
end

def send_off
  clear_screen
  prompt("Thank you for playing Rock, Paper, Scissors, Lizard, Spock!")
  prompt("Good bye!")
  puts
end

clear_screen

display_greeting

display_instructions

loop do
  break unless ready?

  clear_screen

  scoreboard = { player: 0, computer: 0 }

  round = 0

  loop do
    player_choice = get_player_choice

    computer_choice = get_computer_choice

    clear_screen

    display_choices(player_choice, computer_choice)

    round += 1

    result = determine_round_result(player_choice, computer_choice)

    display_round_result(result, round)

    increment_score(result, scoreboard)

    display_scoreboard(scoreboard)

    break if match_over?(scoreboard)
  end

  display_match_winner(scoreboard)

  break unless play_again?
end

send_off
