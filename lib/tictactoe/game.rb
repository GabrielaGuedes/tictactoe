require_relative './board.rb'
require_relative './human_player.rb'
require_relative './easy_computer_player.rb'
require_relative './medium_computer_player.rb'
require_relative './hard_computer_player.rb'

module Tictactoe
  class Game
    attr_accessor :board, :player_one, :player_two

    DIFFICULTS = %w[Easy Medium Hard]
    MODES = %w[HumanVsHuman HumanVsComputer ComputerVsComputer]

    def self.start
      puts "Select your mode: \n0. Human vs. Human\n1. Human vs. Computer\n2. Computer vs. Computer"
      mode = gets.chomp.to_i

      if mode != 0
        puts "Select your difficult: \n0. Easy\n1. Medium\n2. Hard"
        difficult = gets.chomp.to_i
      end

      eval("Tictactoe::#{Game::MODES[mode]}Game").new(difficult).start
    end

    def start
      print_game_start
      run_game while !game_finished?
      puts 'Game over'
    end

    private

    def print_game_start
      board.print_board
    end

    def run_game
      player_one.play_turn
      player_two.play_turn unless game_finished?
      board.print_board
    end

    def game_finished?
      board.game_is_over_with_winner? || board.tie?
    end
  end
end
