# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.
# --------------Scratch Pad
# - Array#shuffle
# --------------Data Structure
# - Benefits of using nested array for deck:
#   - we mostly don't care about the suit, so this keeps it separated
#   - keeps the value of the card separated, so it's easier to total hands
#   - we can duplicate the `DECK`, shuffle it, and then pop items off - just the
#   way a deck of cards would work in a game in real life