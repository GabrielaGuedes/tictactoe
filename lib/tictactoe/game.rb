require_relative './board.rb'
require_relative './human_player.rb'
require_relative './easy_computer_player.rb'
require_relative './medium_computer_player.rb'
require_relative './hard_computer_player.rb'

class Game
  attr_accessor :board, :player_one, :player_two

  DIFFICULTS = %w[Easy Medium Hard]

  def self.start
    puts "Select your difficult: \n0. Easy\n1. Medium\n2. Hard"
    difficult = gets.chomp.to_i
    new(difficult).start
  end

  def initialize(difficult)
    @board = Tictactoe::Board.new
    @player_one = Tictactoe::HumanPlayer.new(Tictactoe::Board::MARKERS[1], board)
    @player_two = eval("Tictactoe::#{DIFFICULTS[difficult]}ComputerPlayer").new(Tictactoe::Board::MARKERS[0], board)
  end

  def start
    print_game_start
    run_game while !game_finished?
    puts 'Game over'
  end

  private

  def print_game_start
    board.print_board
    puts 'Enter [0-8]:'
  end

  def run_game
    player_one.play_turn
    player_two.play_turn if !game_finished?
    board.print_board
  end

  def game_finished?
    board.game_is_over_with_winner? || board.tie?
  end
end
