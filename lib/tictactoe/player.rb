module Tictactoe
  class Player

    attr_accessor :marker, :board

    def initialize(marker, board)
      @marker = marker
      @board = board
    end

    def play_turn
      raise NotImplementedError
    end

    private

    def fill_spot(spot)
      board.fill_spot(spot, marker)
    end
  end
end
