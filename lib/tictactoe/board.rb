require_relative '../utils/matrix.rb'

module Tictactoe
  class Board
    CENTER_SPOT_INDEX = 4

    attr_accessor :matrix

    def initialize
      @matrix = Utils::Matrix[%w[0 1 2], %w[3 4 5], %w[6 7 8]]
    end

    def print_board
      puts " \n===+===+=== "
      matrix.row_vectors.each do |row|
        row.each do |spot|
          print " #{spot} |"
        end
        print "\b"
        puts " \n===+===+=== "
      end
    end

    def empty_spot?(spot_index)
      matrix.value_at_array_position(spot_index) != 'X' && matrix.value_at_array_position(spot_index) != 'O'
    end

    def fill_spot(spot_index, marker)
      matrix.assign_value_to_array_position(marker, spot_index)
    end

    def to_a
      matrix.to_a.flatten
    end

    def center_spot_available?
      matrix.value_at_array_position(CENTER_SPOT_INDEX) == '4'
    end

    def game_is_over
      any_line_won?(:column) || any_line_won?(:row) || any_line_won?(:diagonal)
    end

    def tie
      matrix.all? { |s| %w[X O].include?(s) }
    end

    private

    def any_line_won?(line_type)
      line_vectors_method = "#{line_type.to_s}_vectors".to_sym

      matrix.send(line_vectors_method).filter do |line|
        line.uniq.length == 1
      end.any?
    end
  end
end
