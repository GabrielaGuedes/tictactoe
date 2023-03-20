# frozen_string_literal: true

require_relative './board'
require_relative './human_player'
require_relative './easy_computer_player'
require_relative './medium_computer_player'
require_relative './hard_computer_player'

module Tictactoe
  class Game
    attr_accessor :board, :player_one, :player_two

    def initialize(_difficult)
      @board = Tictactoe::Board.new
    end

    def start
      print_game_start
      run_game until game_finished?
      puts 'Game over'
    end

    private

    def print_game_start
      board.print_board
    end

    def run_game
      raise NotImplementedError
    end

    def game_finished?
      board.game_is_over_with_winner? || board.tie?
    end
  end
end
