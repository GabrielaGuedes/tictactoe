# frozen_string_literal: true

require_relative './player'

module Tictactoe
  class HumanPlayer < Player
    VALID_INPUT_REGEX = /^[0-8]{1}$/.freeze

    private

    def spot
      puts 'Enter [0-8]:'
      chosen_spot = gets.chomp
      return chosen_spot.to_i if valid_spot(chosen_spot)

      puts 'Invalid input, try again.'
      spot
    end

    def valid_spot(chosen_spot)
      board.empty_spot?(chosen_spot.to_i) && chosen_spot =~ VALID_INPUT_REGEX
    end
  end
end
