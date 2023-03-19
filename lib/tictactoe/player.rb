# frozen_string_literal: true

module Tictactoe
  class Player
    attr_accessor :marker, :board

    def initialize(marker, board)
      @marker = marker
      @board = board
    end

    def play_turn
      fill_spot(spot)
    end

    private

    def fill_spot(spot)
      board.fill_spot(spot, marker)
    end
  end
end
