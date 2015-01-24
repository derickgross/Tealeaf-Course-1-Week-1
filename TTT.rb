#  TTT.rb - a simplified tic tac toe game

def initialize_board
  b = {}
  (1..9).each { |position| b[position] = " " }
  b
end

def draw_board(b)
  system "clear"
  puts " #{b[1]} | #{b[2]} | #{b[3]} "
  puts "---+---+---"
  puts " #{b[4]} | #{b[5]} | #{b[6]} "
  puts "---+---+---"
  puts " #{b[7]} | #{b[8]} | #{b[9]} "  
end

def empty_positions(b)
  b.select { |k, v| v == " " }.keys
end

def player_picks_square(b)
  puts "Pick a square (1 - 9):"
  position = gets.chomp.to_i
  b[position] = "X"
end

def computer_picks_square(b)
  position = empty_positions(b).sample
  b[position] = "O"
end

=begin
def check_winner(b)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    if b[line[0]] == "X" and b[line[1]] == "X" and b[line[2]] == "X"
      return "Player"
    elsif b[line[0]] == "O" and b[line[1]] == "O" and b[line[2]] == "O"
      return "Computer"
    else
      return nil
    end
  end
end
=end

def check_winner(board)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player" if board.values_at(*line).count('X') == 3
    return "Computer" if board.values_at(*line).count('O') == 3
  end
  nil
end

board = initialize_board
draw_board(board)

begin
  player_picks_square(board)
  computer_picks_square(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_positions(board).empty?

if winner
  puts "#{winner} is the winner!"
else
  puts "It's a tie!"
end



=begin
# tic-tac-toe.rb - simple tic tac toe game, without a graphical representation of the board

# name each square in the 3 x 3 grid

@top_left = "top left"
@top_middle = "top middle"
@top_right = "top right"
@left = "left"
@center = "center"
@right = "right"
@bottom_left = "bottom left"
@bottom_middle = "bottom middle"
@bottom_right = "bottom right"

# list of winning combinations

@top_winner = [@top_left, @top_middle, @top_right]
@horizontal_middle_winner = [@left, @center, @right]
@bottom_winner = [@bottom_left, @bottom_middle, @bottom_right]
@left_winner = [@top_left, @left, @bottom_left]
@vertical_middle_winner = [@top_middle, @center, @bottom_middle]
@right_winner = [@top_right, @right, @bottom_right]
@slash_winner = [@top_right, @center, @bottom_left]
@backslash_winner = [@top_left, @center, @bottom_right]

# array of winners

@winners = [@top_winner, @horizontal_middle_winner, @bottom_winner, @left_winner, @vertical_middle_winner, @right_winner, @slash_winner, @backslash_winner]

# list of open squares

@open_squares = [@top_left, @top_middle, @top_right, @left, @center, @right, @bottom_left, @bottom_middle, @bottom_right]


puts "Welcome to Tic Tac Toe!  Would you like to play as X or O?  X will make the first move:"

@player_avatar = gets.chomp
@opponent_avatar = ""
@x_turn = ""
@o_turn = ""

if @player_avatar.upcase.include? "X"
  @player_avatar = "X"
  @opponent_avatar = "O"
  #@x_turn = player_turn
  #@o_turn = opponent_turn
  puts "You are X!"
else
  @player_avatar = "O"
  @opponent_avatar = "X"
  #@x_turn = opponent_turn
  #@o_turn = player_turn
  puts "You are O!"
end

def player_turn
  puts "Select a square from the list of open squares below:"
  puts @open_squares
  choice = gets.chomp
  while !@open_squares.include? choice
    puts "Invalid choice. Please choose an open square:"
    choice = gets.chomp
  end
  @open_squares.each_index { |square| @open_squares[square] = @player_avatar if choice.downcase == square }
  @open_squares.each_index { |i| @open_squares.delete_at(i) if @open_squares[i] == @player_avatar}
  puts "You placed an #{@player_avatar} in the #{choice} square"
  @winners.each { |i| @victory = "You win!" if i.uniq.length == 1 }
  return
end

def opponent_turn
  opponent_choice = ""
  best_options = []
  @winners.each_index { |i| best_options << @winners[i] if @winners[i] != @winners[i].uniq } # if any item in winners contains duplicate values (multiple X's or O's), add it to best options array
  if best_options.length > 1
    best_options.each do |line|
      if line.include? @opponent_avatar # computer prioritizes winning over blocking the player's win
        line.each { |j| opponent_choice = line[j] if line[j] != @opponent_avatar }
      end
    end
  elsif best_options.length == 1
    best_options[0].each { |j| opponent_choice = best_options[0][j] if best_options[0][j].length > 1 } # The item that is not X or O has a length > 1, and computer chooses that value
  else opponent_choice = @open_squares.sample # if there are no "best options", computer randomly chooses an open square
  end
  opponent_choice = @opponent_avatar
  @winners.each { |i| @victory = "Sorry, your opponent wins." if i.uniq.length == 1 }
end

if @player_avatar.upcase.include? "X"
  #@player_avatar = "X"
  #@opponent_avatar = "O"
  @x_turn = player_turn
  @o_turn = opponent_turn
  #puts "You are X!"
else
  #@player_avatar = "O"
  #@opponent_avatar = "X"
  @x_turn = opponent_turn
  @o_turn = player_turn
  #puts "You are O!"
end

@round_counter = 1

@victory = false

while !@victory
  @winners.each_index { |i| @winners.delete_at(i) if @winners[i].include? "X" and @winners[i].include? "O" }
  if @round_counter.odd?
    @x_turn
    @round_counter += 1
  else
    @o_turn
    @round_counter += 1
  end
end
=end