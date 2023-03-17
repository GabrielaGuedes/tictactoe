require_relative './player.rb'

module Tictactoe
  class HumanPlayer < Player

    private
    
    def spot
      chosen_spot = gets.chomp.to_i
      return chosen_spot if board.empty_spot?(chosen_spot)

      spot
    end
  end
end
