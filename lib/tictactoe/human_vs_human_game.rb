require_relative './board.rb'
require_relative './game.rb'
require_relative './human_player.rb'

module Tictactoe
  class HumanVsHumanGame < Game
    def initialize(_difficult)
      @board = Tictactoe::Board.new
      @player_one = Tictactoe::HumanPlayer.new(Tictactoe::Board::MARKERS[1], board)
      @player_two = Tictactoe::HumanPlayer.new(Tictactoe::Board::MARKERS[0], board)
    end
  end
end
