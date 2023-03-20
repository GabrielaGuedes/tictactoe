# frozen_string_literal: true

module Tictactoe
  class Player
    attr_accessor :marker, :board, :number

    def initialize(marker, board, number)
      @marker = marker
      @board = board
      @number = number
    end

    def play_turn
      puts "Player #{number} turn!"
      fill_spot(spot)
    end

    private

    def fill_spot(spot)
      board.fill_spot(spot, marker)
    end
  end
end
