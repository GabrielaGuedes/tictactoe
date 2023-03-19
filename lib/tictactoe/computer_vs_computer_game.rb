require_relative './board.rb'
require_relative './game.rb'
require_relative './human_player.rb'
require_relative './easy_computer_player.rb'
require_relative './medium_computer_player.rb'
require_relative './hard_computer_player.rb'

module Tictactoe
  class ComputerVsComputerGame < Game
    def initialize(difficult)
      @board = Tictactoe::Board.new
      @player_one = eval("Tictactoe::#{Game::DIFFICULTS[difficult]}ComputerPlayer").new(Tictactoe::Board::MARKERS[1], board)
      @player_two = eval("Tictactoe::#{Game::DIFFICULTS[difficult]}ComputerPlayer").new(Tictactoe::Board::MARKERS[0], board)
    end

    private

    def run_game
      player_one.play_turn
      sleep 1
      player_two.play_turn unless game_finished?
      sleep 1
      board.print_board
    end
  end
end
