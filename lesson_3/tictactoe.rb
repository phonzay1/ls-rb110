require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8]] +
                [[3, 6, 9], [1, 5, 9], [3, 5, 7]]
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "==> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  #system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |           1|2|3"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}        -+-+-"
  puts "     |     |           4|5|6"
  puts "-----+-----+-----      -+-+-"
  puts "     |     |           7|8|9"
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

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, punctuation = ", ", conjunction = "or")
  case arr.size
  when 0 then ""
  when 1 then "#{arr[0]}"
  when 2 then "#{arr[0]} #{conjunction} #{arr[1]}"
  else "#{arr[0..-2].join(punctuation)}#{punctuation}#{conjunction} #{arr[-1]}"
  end
end

def determine_initial_player
  num = ''

  loop do
    prompt("Who would you like to go first? Enter 1 for you, 2 for the " \
    "computer, or 3 to let the computer choose.")
    num = gets.chomp.to_i
    break if (1..3).include?(num)
    prompt("Sorry, that's not a valid choice.")
  end

  case num
  when 1 then 'Player'
  when 2 then 'Computer'
  when 3
    player = ['Player', 'Computer'].sample
    puts "Computer chose #{player} to go first."
    player
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square: #{joinor(empty_squares(brd))} (see grid above " \
    "for numbers):")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2 &&
       brd.values_at(*line).count(INITIAL_MARKER) == 1
      return brd.select{|k, v| line.include?(k) && v == INITIAL_MARKER}.keys.first
    elsif brd.values_at(*line).count(PLAYER_MARKER) == 2 &&
          brd.values_at(*line).count(INITIAL_MARKER) == 1
      return brd.select{|k, v| line.include?(k) && v == INITIAL_MARKER}.keys.first
    end
  end
  nil
end

def computer_places_piece!(brd)
  if find_at_risk_square(brd)
    #binding.pry
    brd[find_at_risk_square(brd)] = COMPUTER_MARKER
  elsif brd[5] == INITIAL_MARKER
    brd[5] = COMPUTER_MARKER
  else
    #binding.pry
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def place_piece!(brd, player)
  player == 'Player' ? player_places_piece!(brd) : computer_places_piece!(brd)
end

def alternate_player(player)
  player == 'Player' ? 'Computer' : 'Player'
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

def play_again?
  prompt("Would you like to play again? (enter 'y' for yes, 'n' for no)")
  gets.chomp.downcase
end

prompt("Welcome to Tic Tac Toe! You'll be playing against the computer. First " \
      "player with 5 wins is the grand winner.")
player_wins = 0
computer_wins = 0

loop do
  board = initialize_board
  current_player = determine_initial_player

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
    system 'clear'
  end

  display_board(board)

  prompt(someone_won?(board) ? "#{detect_winner(board)} won!" : "It's a tie!")

  if detect_winner(board) == 'Player'
    player_wins += 1
  elsif detect_winner(board) == 'Computer'
    computer_wins += 1
  end

  prompt("You've won #{player_wins} times. The computer has won " \
        "#{computer_wins} times.")

  if player_wins >= 5
    prompt("You're the grand winner!")
    break
  elsif computer_wins >= 5
    prompt("The computer is the grand winner!")
    break
  end

  #break unless play_again?.start_with?('y')
end

prompt("Thank you for playing! Goodbye.")
