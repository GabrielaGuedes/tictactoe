# frozen_string_literal: true

require 'matrix'

module Utils
  class Matrix < Matrix
    def assign_value_to_array_position(value, array_position)
      self[*row_column_from_array_position(array_position)] = value
    end

    def value_at_array_position(array_position)
      self[*row_column_from_array_position(array_position)]
    end

    def diagonal_vectors
      [each(:diagonal).to_a, each(:inverse_diagonal).to_a]
    end

    def each(which = :all)
      return to_enum :each, which unless block_given?

      return super(which) unless which == :inverse_diagonal

      last = column_count - 1
      @rows.each_with_index do |row, row_index|
        yield row.fetch(last - row_index) { return self }
      end

      self
    end

    private

    def row_column_from_array_position(array_position)
      row = array_position / column_count
      column = array_position % column_count

      [row, column]
    end
  end
end
