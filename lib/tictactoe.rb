require_relative './tictactoe/board.rb'
require_relative './tictactoe/human_player.rb'
require_relative './tictactoe/computer_player.rb'

class Game

  attr_accessor :board, :player_one, :player_two

  def initialize
    @board = Tictactoe::Board.new
    @player_one = Tictactoe::HumanPlayer.new(Tictactoe::Board::MARKERS[1], board)
    @player_two = Tictactoe::ComputerPlayer.new(Tictactoe::Board::MARKERS[0], board)
  end

  def start_game
    # start by printing the board
    board.print_board
    puts 'Enter [0-8]:'
    # loop through until the game was won or tied
    until board.game_is_over_with_winner? || board.tie?
      player_one.play_turn
      player_two.play_turn if !board.game_is_over_with_winner? && !board.tie?
      board.print_board
    end
    puts 'Game over'
  end
end

Game.new.start_game
