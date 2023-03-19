require_relative './board.rb'
require_relative './game.rb'
require_relative './human_player.rb'
require_relative './easy_computer_player.rb'
require_relative './medium_computer_player.rb'
require_relative './hard_computer_player.rb'

module Tictactoe
  class HumanVsComputerGame < Game
    def initialize(difficult)
      @board = Tictactoe::Board.new
      @player_one = Tictactoe::HumanPlayer.new(Tictactoe::Board::MARKERS[1], board)
      @player_two = eval("Tictactoe::#{Game::DIFFICULTS[difficult]}ComputerPlayer").new(Tictactoe::Board::MARKERS[0], board)
    end
  end
end
