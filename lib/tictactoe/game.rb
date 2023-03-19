# frozen_string_literal: true

require_relative './board'
require_relative './human_player'
require_relative './easy_computer_player'
require_relative './medium_computer_player'
require_relative './hard_computer_player'

module Tictactoe
  class Game
    attr_accessor :board, :player_one, :player_two

    DIFFICULTS = %w[Easy Medium Hard].freeze
    MODES = %w[HumanVsHuman HumanVsComputer ComputerVsComputer].freeze

    def self.start
      puts "Select your mode: \n0. Human vs. Human\n1. Human vs. Computer\n2. Computer vs. Computer"
      mode = gets.chomp.to_i

      if mode != 0
        puts "Select your difficult: \n0. Easy\n1. Medium\n2. Hard"
        difficult = gets.chomp.to_i
      end

      eval("Tictactoe::#{Game::MODES[mode]}Game").new(difficult).start
    end

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
