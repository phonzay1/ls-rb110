require 'pry'

SUITS = %w(H D S C)
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

def prompt(msg)
  puts ">> #{msg}"
end

def joinand(arr)
  case arr.size
  when 0 then ""
  when 1 then arr[0].to_s
  when 2 then arr[0].to_s + 'and' + arr[1].to_s
  else "#{arr[0..-2].join(', ')} and" + arr[-1].to_s
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

  hand.map { |card| card[1] }.count('A').times { |_| sum -= 10 if sum > 21 }
  sum
end

def player_turn(hand, deck)
  loop do
    prompt "Enter 'h' to hit or 's' to stay."
    answer = gets.chomp.downcase
    if answer.start_with?('h')
      hand << deck.pop
      values = hand.map { |card| display_value(card) }
      prompt "You have #{joinand(values)} (total: #{calculate_hand(hand)})"
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
    break if calculate_hand(hand) >= 17 || busted?(hand)
    prompt "Dealer hit!"
    hand << deck.pop
    values = hand.map { |card| display_value(card) }
    prompt "Dealer has: #{joinand(values)} (total: #{calculate_hand(hand)})."
  end
end

def busted?(hand)
  calculate_hand(hand) > 21
end

def return_winner(player_hand, dealer_hand)
  if calculate_hand(player_hand) > calculate_hand(dealer_hand)
    "You"
  elsif calculate_hand(dealer_hand) > calculate_hand(player_hand)
    "Dealer"
  else
    "Tie"
  end
end

def display_results(winner, player_hand, dealer_hand)
  player_hand_values = player_hand.map { |card| display_value(card) }
  dealer_hand_values = dealer_hand.map { |card| display_value(card) }
  prompt "Your ending hand was: #{joinand(player_hand_values)} (total: " \
         "#{calculate_hand(player_hand)}). Dealer's ending hand was: " \
         "#{joinand(dealer_hand_values)} (total: #{calculate_hand(dealer_hand)})."
  if winner == "You"
    prompt "Congratulations, you win!"
  elsif winner == "Dealer"
    prompt "Dealer wins. Better luck next time!"
  else
    prompt "It's a tie!"
  end
end

def play_again?
  prompt "Would you like to play again? (enter 'y' for yes, 'n' for no)"
  gets.chomp.downcase.start_with?('y')
end

loop do
  deck = SUITS.product(VALUES).shuffle
  player_hand = deck.pop(2)
  dealer_hand = deck.pop(2)

  prompt "Dealer has: #{display_value(dealer_hand.first)} and unknown card"
  prompt "You have: #{display_value(player_hand.first)} and " \
         "#{display_value(player_hand.last)} (total: #{calculate_hand(player_hand)})"

  player_turn(player_hand, deck)

  if busted?(player_hand)
    prompt "You busted! Dealer wins."
    if play_again?
      system 'clear'
      next
    else
      break
    end
  else
    prompt "You chose to stay."
  end

  dealer_turn(dealer_hand, deck)

  if busted?(dealer_hand)
    prompt "Dealer busted - you win!"
    if play_again?
      system 'clear'
      next
    else
      break
    end
  else
    prompt "Dealer chose to stay."
  end

  winner = return_winner(player_hand, dealer_hand)
  display_results(winner, player_hand, dealer_hand)

  break unless play_again?
  system 'clear'
end

prompt "Thank you for playing Twenty-One. Goodbye!"
