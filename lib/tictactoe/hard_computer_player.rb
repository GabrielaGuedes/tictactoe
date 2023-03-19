require_relative './computer_player'

module Tictactoe
  class HardComputerPlayer < ComputerPlayer
    private

    def get_best_move
      smart_spot || random_spot
    end
  end
end
