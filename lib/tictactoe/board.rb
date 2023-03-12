module Tictactoe
  class Board
    attr_accessor :spots

    def initialize
      @spots = %w[0 1 2 3 4 5 6 7 8]
    end

    def print
      puts " #{spots[0]} | #{spots[1]} | #{spots[2]} \n===+===+===\n #{spots[3]} | #{spots[4]} | #{spots[5]} \n===+===+===\n #{spots[6]} | #{spots[7]} | #{spots[8]} \n"
    end

    def filled_spot?(spot_index)
      spots[spot_index] != 'X' && spots[spot_index] != 'O'
    end

    def fill_spot(spot_index, marker)
      spots[spot_index] = marker
    end

    def center_spot_available?
      spots[4] == '4'
    end

    def game_is_over
      [spots[0], spots[1], spots[2]].uniq.length == 1 ||
        [spots[3], spots[4], spots[5]].uniq.length == 1 ||
        [spots[6], spots[7], spots[8]].uniq.length == 1 ||
        [spots[0], spots[3], spots[6]].uniq.length == 1 ||
        [spots[1], spots[4], spots[7]].uniq.length == 1 ||
        [spots[2], spots[5], spots[8]].uniq.length == 1 ||
        [spots[0], spots[4], spots[8]].uniq.length == 1 ||
        [spots[2], spots[4], spots[6]].uniq.length == 1
    end

    def tie
      spots.all? { |s| %w[X O].include?(s) }
    end
  end
end