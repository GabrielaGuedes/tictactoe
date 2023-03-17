require_relative './player.rb'

module Tictactoe
  class HumanPlayer < Player

    VALID_INPUT_REGEX = /^[0-8]{1}$/

    private
    
    def spot
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
