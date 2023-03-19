# frozen_string_literal: true

require_relative './computer_player'

module Tictactoe
  class HardComputerPlayer < ComputerPlayer
    private

    def best_move
      smart_spot || random_spot
    end
  end
end
