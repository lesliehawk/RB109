INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diags

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

def player_choice
  choice = ''
  loop do
    prompt "Who should go first? (P)layer or (C)omputer?"
    answer = gets.chomp.downcase
    if answer[0] == 'p'
      choice = "Player"
    elsif answer[0] == 'c'
      choice = "Computer"
    else
      prompt "Sorry, that is not a valid choice."
    end
    break if choice == "Player" || choice == "Computer"
  end
  prompt "Player chose #{choice.upcase} to go first."
  choice
end

def computer_choice
  choice = ["Player", "Computer"].sample
  prompt "Computer chose #{choice.upcase} to go first."
  choice
end

def who_goes_first(coin_toss)
  coin_toss == "Player" ? player_choice : computer_choice
end

def joinor(arr, separator=', ', conjunction='or')
  arr[-1] = "#{conjunction} #{arr[-1]}" if arr.size > 1
  separator = ' ' if arr.size <= 2
  arr.join(separator)
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def immediate_win(brd)
  win = []

  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2 &&
       brd.values_at(*line).any?(INITIAL_MARKER)
      line.each do |square|
        win << square if brd[square] == INITIAL_MARKER
      end
    end
  end

  win.empty? ? false : win.sample
end

def immediate_threat(brd)
  threat = []

  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
       brd.values_at(*line).any?(INITIAL_MARKER)
      line.each do |square|
        threat << square if brd[square] == INITIAL_MARKER
      end
    end
  end

  threat.empty? ? false : threat.sample
end

def computer_places_piece!(brd)
  square = if immediate_win(brd)
             immediate_win(brd)
           elsif immediate_threat(brd)
             immediate_threat(brd)
           elsif brd[5] == INITIAL_MARKER
             5
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

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def update_scoreboard(scorebrd, winner)
  scorebrd[winner] += 1
end

def match_winner?(scorebrd)
  scorebrd.values.any?(5)
end

def detect_match_winner(scorebrd)
  scorebrd["Player"] == 5 ? "Player" : "Computer"
end

def display_match_points(scorebrd)
  puts ""
  puts "Match Scoreboard: First to 5 wins the match!"
  puts ""
  puts "Player: #{scorebrd['Player']}"
  puts "Computer: #{scorebrd['Computer']}"
  puts ""
end

loop do
  system 'clear'
  scoreboard = { "Player" => 0, "Computer" => 0 }

  welcome

  current_player = who_goes_first(coin_toss)

  puts ''
  prompt "Ready to play? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')

  loop do
    board = initialize_board

    loop do
      display_board(board)

      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      update_scoreboard(scoreboard, detect_winner(board))
    else
      prompt "It's a tie!"
    end

    display_match_points(scoreboard)

    if match_winner?(scoreboard)
      prompt "#{detect_match_winner(scoreboard)} won the match!"
      break
    end

    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end

  prompt "Play another match? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
