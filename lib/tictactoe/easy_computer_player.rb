require_relative './computer_player.rb'

module Tictactoe
  class EasyComputerPlayer < ComputerPlayer

    private

    def get_best_move
      random_spot
    end
  end
end
