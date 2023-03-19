require_relative './computer_player.rb'

module Tictactoe
  class HardComputerPlayer < ComputerPlayer

    private

    def get_best_move
      smart_spot || random_spot
    end
  end
end
