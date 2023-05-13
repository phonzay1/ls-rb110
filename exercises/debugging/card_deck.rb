cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.dup,
         :diamonds => cards.dup,
         :clubs    => cards.dup,
         :spades   => cards.dup }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  score_of_remaining_cards = remaining_cards.map do |card|
    score(card)
  end

  sum += score_of_remaining_cards.sum
end

puts sum

total_sum  = 4 * [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11].sum
player_sum = player_cards.map { |card| score(card) }.sum

puts(sum == total_sum - player_sum)

=begin
Once you get the program to run and produce a sum, you might notice that the sum
is off: It's lower than it should be. Why is that?
------
This is because the hash that's used to store the deck of cards (`deck`) uses the
array referenced by local variable `cards` to store the cards for each suit in
the deck. On lines 20-25 when we create the hand of cards in `player_cards` by
iterating over the cards in each suit, we end up mutating the array referenced
by `cards` on each iteration. `cards` is now missing four cards, and when `cards`
is referenced for each suit in the deck, it looks like each suit is missing four
cards - thus 16 cards total are "missing" from the deck, rather than 4.
=end