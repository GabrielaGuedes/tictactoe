# frozen_string_literal: true

require_relative '../utils/matrix'

module Tictactoe
  class Board
    CENTER_SPOT_INDEX = 4
    MARKERS = %w[X O].freeze

    attr_accessor :matrix

    def initialize
      @matrix = Utils::Matrix[%w[0 1 2], %w[3 4 5], %w[6 7 8]]
    end

    def print_board
      puts row_separator
      matrix.row_vectors.each do |row|
        row.each do |spot|
          print " #{spot} |"
        end
        print "\b"
        puts row_separator
      end
    end

    def empty_spot?(spot_index)
      !MARKERS.include? matrix.value_at_array_position(spot_index)
    end

    def fill_spot(spot_index, marker)
      matrix.assign_value_to_array_position(marker, spot_index)
    end

    def to_a
      matrix.to_a.flatten
    end

    def center_spot_available?
      available_spots.include? CENTER_SPOT_INDEX
    end

    def game_is_over_with_winner?
      any_line_won?(:column) || any_line_won?(:row) || any_line_won?(:diagonal)
    end

    def tie?
      matrix.all? { |s| MARKERS.include?(s) }
    end

    def available_spots
      to_a.filter_map.with_index { |_spot, index| index if empty_spot?(index) }
    end

    def random_available_spot
      available_spots.sample.to_i
    end

    private

    def any_line_won?(line_type)
      line_vectors_method = "#{line_type}_vectors".to_sym

      matrix.send(line_vectors_method).filter do |line|
        line.uniq.length == 1
      end.any?
    end

    def row_separator
      " \n===+===+=== "
    end
  end
end
