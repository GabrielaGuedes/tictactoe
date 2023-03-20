# frozen_string_literal: true

require_relative './board'
require_relative './game'
require_relative './human_player'

module Tictactoe
  class HumanVsHumanGame < Game
    def initialize(_difficult)
      super
      @player_one = Tictactoe::HumanPlayer.new(Tictactoe::Board::MARKERS[1], board, 1)
      @player_two = Tictactoe::HumanPlayer.new(Tictactoe::Board::MARKERS[0], board, 2)
    end

    private

    def run_game
      player_one.play_turn
      board.print_board
      player_two.play_turn unless game_finished?
      board.print_board
    end
  end
end
