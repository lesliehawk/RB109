require 'pry'
require 'byebug'
require 'pry-doc'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diags

def immediate_threat(brd)
  threat = []
  # threat_lines = WINNING_LINES.select do |line|
  #   brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
  #   brd.values_at(*line).any?(INITIAL_MARKER)
  # end

  # p threat_lines

  # threat_lines.each do |line|
  #   line.each do |square|
  #     threat << square if brd[square] == INITIAL_MARKER
  #   end
  # end

  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
       brd.values_at(*line).any?(INITIAL_MARKER)
      line.each do |square|
        threat << square if brd[square] == INITIAL_MARKER
      end
    end
  end

  puts threat

  threat.empty? ? false : threat.sample
end

board = {1=>"X", 2=>"X", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}

p immediate_threat(board)
