INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diags

WINNING_SCORE = 5
BOARD_SIZE = 3
CENTER_SQUARE = 5

ANSWER = ['y', 'yes', 'n', 'no']
CHOICE = ['p', 'player', 'c', 'computer']

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're a #{PLAYER_MARKER}. Computer is a #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def welcome
  prompt "Welcome to Tic Tac Toe!"
  puts ''
  sleep(1)
end

def coin_toss
  prompt "Coin tossed to determine who goes first..."
  sleep(1.5)
  toss_winner = ["Computer", "Player"].sample
  puts ''
  prompt "#{toss_winner} gets to choose:"
  sleep(1.5)
  toss_winner
end

def valid_choice
  choice = ''
  loop do
    prompt "Who should go first? (P)layer or (C)omputer?"
    choice = gets.chomp.downcase
    break if CHOICE.include?(choice)
    prompt "Sorry, that is not a valid choice."
  end
  choice
end

def player_choice(vld_choice)
  vld_choice == 'p' || vld_choice == 'player' ? 'Player' : 'Computer'
end

def computer_choice
  ["Player", "Computer"].sample
end

def display_who_goes_first(opponent, choice)
  prompt "#{opponent} chose #{choice.upcase} to go first."
end

def who_goes_first(coin_winner)
  coin_winner == "Player" ? player_choice(valid_choice) : computer_choice
end

def continue_to_play?(question)
  choice = ''
  loop do
    puts ''
    prompt "#{question} (y or n)"
    choice = gets.chomp.downcase
    break if ANSWER.include?(choice)
    prompt "Sorry, that is not a valid choice."
  end
  choice == 'y' || choice == 'yes'
end

def joinor(arr, separator=', ', conjunction='or')
  arr[-1] = "#{conjunction} #{arr[-1]}" if arr.size > 1
  separator = ' ' if arr.size <= 2
  arr.join(separator)
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def get_whole_number(brd)
  answer = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    answer = gets.chomp
    break if answer.scan(/\D/).empty?
    prompt "Please input a  whole number."
  end
  answer.to_i
end

def player_places_piece!(brd)
  square = ''
  loop do
    square = get_whole_number(brd)
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def strategic_move(brd, marker)
  move = []

  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == (BOARD_SIZE - 1) &&
       brd.values_at(*line).any?(INITIAL_MARKER)
      line.each do |square|
        move << square if brd[square] == INITIAL_MARKER
      end
    end
  end

  move.empty? ? false : move.sample
end

def computer_places_piece!(brd)
  square = if strategic_move(brd, COMPUTER_MARKER)
             strategic_move(brd, COMPUTER_MARKER)
           elsif strategic_move(brd, PLAYER_MARKER)
             strategic_move(brd, PLAYER_MARKER)
           elsif brd[CENTER_SQUARE] == INITIAL_MARKER
             CENTER_SQUARE
           else
             empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
end

def place_piece!(brd, player)
  player == "Player" ? player_places_piece!(brd) : computer_places_piece!(brd)
end

def alternate_player(player)
  player == "Player" ? "Computer" : "Player"
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def round_winner?(brd)
  !!detect_round_winner(brd)
end

def detect_round_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == BOARD_SIZE
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == BOARD_SIZE
      return 'Computer'
    end
  end
  nil # passes to someone_won? That will turn nil into a false by applying !!
end

def update_scoreboard(scorebrd, winner)
  scorebrd[winner] += 1
end

def match_winner?(scorebrd)
  scorebrd.values.any?(WINNING_SCORE)
end

def detect_match_winner(scorebrd)
  scorebrd["Player"] == WINNING_SCORE ? "Player" : "Computer"
end

def display_match_points(scorebrd)
  puts ""
  puts "Match Scoreboard: First to #{WINNING_SCORE} wins the match!"
  puts ""
  puts "Player: #{scorebrd['Player']}"
  puts "Computer: #{scorebrd['Computer']}"
  puts ""
end

loop do
  system 'clear'
  scoreboard = { "Player" => 0, "Computer" => 0 }

  welcome

  toss_winner = coin_toss
  current_player = who_goes_first(toss_winner)

  display_who_goes_first(toss_winner, current_player)

  break unless continue_to_play?("Ready to play?")

  loop do
    board = initialize_board

    loop do
      display_board(board)

      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if round_winner?(board) || board_full?(board)
    end

    display_board(board)

    if round_winner?(board)
      prompt "#{detect_round_winner(board)} won!"
      update_scoreboard(scoreboard, detect_round_winner(board))
    else
      prompt "It's a tie!"
    end

    display_match_points(scoreboard)

    if match_winner?(scoreboard)
      prompt "#{detect_match_winner(scoreboard)} won the match!"
      break
    end

    break unless continue_to_play?("Continue to next round?")
  end

  break unless continue_to_play?("Play another match?")
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
