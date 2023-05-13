require 'pry'

MAX_HAND_VALUE = 41
DEALER_HIT_UNTIL = 37

SUITS = %w(H D S C)
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

def prompt(msg)
  puts ">> #{msg}"
end

def joinand(arr)
  case arr.size
  when 0 then ""
  when 1 then arr[0].to_s
  when 2 then arr[0].to_s + ' and ' + arr[1].to_s
  else "#{arr[0..-2].join(', ')}, and " + arr[-1].to_s
  end
end

def display_value(card)
  case card[1]
  when 'J' then 'Jack'
  when 'Q' then 'Queen'
  when 'K' then 'King'
  when 'A' then 'Ace'
  else card[1]
  end
end

def calculate_hand(hand)
  sum = 0
  hand.each do |_suit, value|
    if value == 'A'
      sum += 11
    elsif ['J', 'Q', 'K'].include?(value)
      sum += 10
    else
      sum += value.to_i
    end
  end

  hand.map { |card| card[1] }.count('A').times { |_| sum -= 10 if sum > MAX_HAND_VALUE }
  sum
end

def player_turn(hand, deck)
  loop do
    prompt "Enter 'h' to hit or 's' to stay."
    answer = gets.chomp.downcase
    if answer.start_with?('h')
      hand << deck.pop
      values = hand.map { |card| display_value(card) }
      prompt "You have: #{joinand(values)} (total: #{calculate_hand(hand)})"
      break if busted?(hand)
    elsif answer.start_with?('s') || busted?(hand)
      break
    else
      puts "Sorry, that's not a valid choice."
    end
  end
end

def dealer_turn(hand, deck)
  loop do
    break if calculate_hand(hand) >= DEALER_HIT_UNTIL || busted?(hand)
    prompt "Dealer hit!"
    hand << deck.pop
    values = hand.map { |card| display_value(card) }
    prompt "Dealer has: #{joinand(values)} (total: #{calculate_hand(hand)})."
  end
end

def busted?(hand)
  calculate_hand(hand) > MAX_HAND_VALUE
end

def return_winner(player_total, dealer_total)
  if player_total > dealer_total
    "You"
  elsif dealer_total > player_total
    "Dealer"
  else
    "Tie"
  end
end

def display_winner(winner)
  if winner == "You"
    prompt "Congratulations, you win!"
  elsif winner == "Dealer"
    prompt "Dealer wins. Better luck next time!"
  else
    prompt "It's a tie!"
  end
end

def display_final_hands(player_hand, dealer_hand, player_total, dealer_total,
                       player_wins, dealer_wins)
  player_hand_values = player_hand.map { |card| display_value(card) }
  dealer_hand_values = dealer_hand.map { |card| display_value(card) }
  prompt "Your ending hand was: #{joinand(player_hand_values)} (total: " \
         "#{player_total}). Dealer's ending hand was: " \
         "#{joinand(dealer_hand_values)} (total: #{dealer_total})."
  prompt "You have won #{player_wins} times. Dealer has won #{dealer_wins} " \
         "times."
end

def detect_overall_winner(player_wins, dealer_wins)
  if player_wins >= 5
    'Player'
  elsif dealer_wins >= 5
    'Dealer'
  end
end

def display_overall_winner(overall_winner)
  case overall_winner
  when 'Player' then prompt "You have won 5 rounds. You're the grand champion!"
  when 'Dealer' then prompt "Dealer has won 5 rounds. They win the game!"
  end
end

def play_again?
  prompt "Would you like to play again? (enter 'y' for yes, 'n' for no)"
  gets.chomp.downcase.start_with?('y')
end

# Start of game play
prompt "Welcome to Twenty-One! You'll be playing against the Dealer (the " \
       "computer). First player to win 5 rounds is the overall winner."

player_wins = 0
dealer_wins = 0

loop do
  deck = SUITS.product(VALUES).shuffle
  player_hand = deck.pop(2)
  dealer_hand = deck.pop(2)
  player_total = calculate_hand(player_hand)
  dealer_total = calculate_hand(dealer_hand)

  prompt "Dealer has: #{display_value(dealer_hand.first)} and unknown card"
  prompt "You have: #{display_value(player_hand.first)} and " \
         "#{display_value(player_hand.last)} (total: #{player_total})"

  player_turn(player_hand, deck)
  player_total = calculate_hand(player_hand)

  if busted?(player_hand)
    prompt "You busted! Dealer wins."
    dealer_wins += 1
    display_final_hands(player_hand, dealer_hand, player_total, dealer_total,
                       player_wins, dealer_wins)
    overall_winner = detect_overall_winner(player_wins, dealer_wins)

    if overall_winner
      display_overall_winner(overall_winner)
      break
    elsif play_again?
      system 'clear'
      next
    else
      break
    end
  else
    prompt "You chose to stay."
  end

  dealer_turn(dealer_hand, deck)
  dealer_total = calculate_hand(dealer_hand)

  if busted?(dealer_hand)
    prompt "Dealer busted - you win!"
    player_wins += 1
    display_final_hands(player_hand, dealer_hand, player_total, dealer_total,
                       player_wins, dealer_wins)
    overall_winner = detect_overall_winner(player_wins, dealer_wins)

    if overall_winner
      display_overall_winner(overall_winner)
      break
    elsif play_again?
      system 'clear'
      next
    else
      break
    end
  else
    prompt "Dealer chose to stay."
  end

  winner = return_winner(player_total, dealer_total)

  case winner
  when 'You' then player_wins += 1
  when 'Dealer' then dealer_wins += 1
  end

  display_winner(winner)
  display_final_hands(player_hand, dealer_hand, player_total, dealer_total,
                     player_wins, dealer_wins)

  overall_winner = detect_overall_winner(player_wins, dealer_wins)
  if overall_winner
    display_overall_winner(overall_winner)
    break
  end

  break unless play_again?
  system 'clear'
end

prompt "Thank you for playing Twenty-One. Goodbye!"
