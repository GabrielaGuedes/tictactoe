require_relative './tictactoe/board.rb'
require_relative './tictactoe/human_player.rb'

class Game

  attr_accessor :board, :player_one

  def initialize
    @board = Tictactoe::Board.new
    @player_one = Tictactoe::HumanPlayer.new(Tictactoe::Board::MARKERS[1], board)
    @com = 'X' # the computer's marker
    @hum = 'O' # the user's marker
  end

  def start_game
    # start by printing the board
    board.print_board
    puts 'Enter [0-8]:'
    # loop through until the game was won or tied
    until board.game_is_over_with_winner? || board.tie?
      player_one.play_turn
      eval_board if !board.game_is_over_with_winner? && !board.tie?
      board.print_board
    end
    puts 'Game over'
  end

  def eval_board
    spot = nil
    until spot
      if board.center_spot_available?
        spot = 4
        board.fill_spot(spot, @com)
      else
        spot = get_best_move
        if board.empty_spot?(spot)
          board.fill_spot(spot, @com)
        else
          spot = nil
        end
      end
    end
  end

  def get_best_move
    available_spaces = []
    best_move = nil
    board.to_a.each do |s|
      available_spaces << s if s != 'X' && s != 'O'
    end
    available_spaces.each do |as|
      board.fill_spot(as.to_i, @com)
      if board.game_is_over_with_winner?
        best_move = as.to_i
        board.fill_spot(as.to_i, as)
        return best_move
      else
        board.fill_spot(as.to_i, @hum)
        if board.game_is_over_with_winner?
          best_move = as.to_i
          board.fill_spot(as.to_i, as)
          return best_move
        else
          board.fill_spot(as.to_i, as)
        end
      end
    end
    return best_move if best_move

    n = rand(0..available_spaces.count)
    available_spaces[n].to_i
  end
end

Game.new.start_game
