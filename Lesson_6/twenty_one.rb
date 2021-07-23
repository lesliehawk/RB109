SUITS = ["\u2665", "\u2660", "\u2666", "\u2663"]
VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

WINNING_NO = 21
DEALER_MAX = 17
ROUNDS = 5

def prompt(string)
  puts "=> #{string}"
end

def display_welcome
  system 'clear'
  print "WELCOME TO #{WINNING_NO}!\n"\
  "\n"\
  "Score as close to #{WINNING_NO} as possible to beat the dealer's score.\n"\
  "But be careful! If you go over #{WINNING_NO}, it's a 'bust' and you lose.\n"\
  "\n"\
  "First deal is two cards each. You can only see the dealer's first card.\n"\
  "Player goes first. You can chose to 'hit' (take a card) or 'stay'. \n"\
  "Best out of #{ROUNDS} rounds wins the game!\n"\
  "\n"
end

def valid_answer(options)
  answer = ''
  loop do
    answer = gets.chomp.downcase
    break if options.include?(answer)
    prompt "Invalid answer. Please try again."
  end

  answer
end

def want_to_play?(string=WINNING_NO.to_s)
  prompt("Do you want to play #{string}? (y)es/(n)o")
  valid_answer(['yes', 'no', 'y', 'n']).chr == 'y'
end

def new_deck
  VALUES.product(SUITS)
end

def shuffle(cards)
  cards.shuffle!
end

def deal_cards(p_hand, d_hand, deck)
  p_hand << deck.pop(2)
  d_hand << deck.pop(2)
end

def display_cards(hand)
  hand.flatten(1).map(&:join).join(', ')
end

def update_score(hand, score_hash, turn)
  values = hand.flat_map { |sub1| sub1.map { |sub2| sub2[0] } }

  sum = 0
  values.each do |value|
    sum += if value == 'A'
             11
           elsif value.to_i == 0
             10
           else
             value.to_i
           end
  end

  sum = modify_ace(hand, sum)

  score_hash[turn] = sum
end

def modify_ace(hand, total_sum)
  values = hand.flat_map { |sub1| sub1.map { |sub2| sub2[0] } }

  values.select { |value| value == "A" }.count.times do
    total_sum -= 10 if total_sum > 21
  end
  total_sum
end

def display_table(p_hand, d_hand, specific_cards, score)
  prompt("Player's cards: #{display_cards(p_hand)}")
  prompt("Player's total = #{score['Player']}")
  puts ''
  prompt("Dealer's cards: #{(display_cards(d_hand))[specific_cards]}")
end

def busted?(hash, turn)
  hash[turn] > WINNING_NO
end

def hit_or_stay
  puts ''
  prompt("Do you want to hit or stay? (h)it/(s)tay)")
  valid_answer(['hit', 'stay', 'h', 's'])
end

def hit(hand, deck)
  hand[0] << deck.pop
end

def player_turn(p_hand, d_hand, deck, hash)
  loop do
    system 'clear'
    puts "PLAYER'S TURN"
    display_table(p_hand, d_hand, 0..1, hash)
    break if busted?(hash, 'Player')
    break if hit_or_stay.chr == 's'
    hit(p_hand, deck)
    update_score(p_hand, hash, "Player")
  end
end

def display_dealer_score(hash)
  prompt("Dealer's total = #{hash['Dealer']}")
end

def dealer_turn(d_hand, p_hand, deck, hash)
  loop do
    break if hash["Dealer"] >= DEALER_MAX
    hit(d_hand, deck)
    update_score(d_hand, hash, "Dealer")
  end
  system 'clear'
  puts "DEALER'S TURN"
  display_table(p_hand, d_hand, 0..-1, hash)
  display_dealer_score(hash)
end

def determine_winner(hash)
  player_score = hash['Player']
  dealer_score = hash['Dealer']

  if player_score > WINNING_NO
    :player_busted
  elsif dealer_score > WINNING_NO
    :dealer_busted
  elsif dealer_score < player_score
    :player
  elsif dealer_score > player_score
    :dealer
  else
    :tie
  end
end

def declare_winner(winner, board)
  puts ''
  case winner
  when :player_busted
    prompt("PLAYER BUSTED. DEALER WINS ROUND #{board['Round']}.")
  when :dealer_busted
    prompt("DEALER BUSTED. PLAYER WINS ROUND #{board['Round']}.")
  when :player
    prompt("PLAYER WINS ROUND #{board['Round']}.")
  when :dealer
    prompt("DEALER WINS ROUND #{board['Round']}.")
  when :tie
    prompt("ROUND #{board['Round']} IS A TIE!")
  end
end

def update_scoreboard(winner, board)
  case winner
  when :player_busted
    board["Dealer"] += 1
  when :dealer_busted
    board["Player"] += 1
  when :player
    board["Player"] += 1
  when :dealer
    board["Dealer"] += 1
  end
  board["Round"] += 1
end

def display_scoreboard(board)
  puts ''
  puts "----------------------------"
  puts "SCOREBOARD: (#{board['Round'] - 1}/#{ROUNDS})"
  puts ""
  puts "Player Wins: #{board['Player']}"
  puts "Dealer Wins: #{board['Dealer']}"
  puts ''
end

def declare_game_winner(board)
  if board["Round"] > ROUNDS
    if board['Player'] == board['Dealer']
      puts "*** TIE GAME! ***"
    else
      winner = board['Player'] > board['Dealer'] ? 'PLAYER' : 'DEALER'
      puts "*** #{winner} WINS THE GAME! ***"
    end
    puts ''
    true
  end
end

def reset(board)
  board["Player"] = 0
  board["Dealer"] = 0
  board["Round"] = 1
end

def display_goodbye
  prompt("Thank you for playing #{WINNING_NO}! Good bye.")
end

loop do
  display_welcome
  break unless want_to_play?

  scoreboard = { "Player" => 0, "Dealer" => 0, "Round" => 1 }

  loop do
    deck = new_deck

    shuffle(deck)

    player = []
    dealer = []

    score = { "Player" => 0, "Dealer" => 0 }

    deal_cards(player, dealer, deck)

    update_score(player, score, "Player")
    update_score(dealer, score, "Dealer")

    player_turn(player, dealer, deck, score)
    dealer_turn(dealer, player, deck, score) unless busted?(score, 'Player')

    round_winner = determine_winner(score)

    declare_winner(round_winner, scoreboard)

    update_scoreboard(round_winner, scoreboard)

    display_scoreboard(scoreboard)

    break if declare_game_winner(scoreboard)

    break unless want_to_play?("another round")
  end
  break unless want_to_play?("another GAME of #{WINNING_NO}")
  reset(scoreboard)
end
display_goodbye
