require_relative './board'
require_relative './game'
require_relative './human_player'
require_relative './easy_computer_player'
require_relative './medium_computer_player'
require_relative './hard_computer_player'

module Tictactoe
  class HumanVsComputerGame < Game
    def initialize(difficult)
      @board = Tictactoe::Board.new
      @player_one = Tictactoe::HumanPlayer.new(Tictactoe::Board::MARKERS[1], board)
      @player_two = eval("Tictactoe::#{Game::DIFFICULTS[difficult]}ComputerPlayer").new(Tictactoe::Board::MARKERS[0],
                                                                                        board)
    end

    private

    def run_game
      player_one.play_turn
      player_two.play_turn unless game_finished?
      board.print_board
    end
  end
end
