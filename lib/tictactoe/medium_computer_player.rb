require_relative './computer_player.rb'

module Tictactoe
  class MediumComputerPlayer < ComputerPlayer

    private

    def get_best_move
      return random_spot if should_perform_easy_move?
    
      smart_spot || random_spot
    end
    
    def should_perform_easy_move?
      rand(1..10) < 5
    end
  end
end
