require_relative './computer_player'

module Tictactoe
  class EasyComputerPlayer < ComputerPlayer
    private

    def get_best_move
      random_spot
    end
  end
end
