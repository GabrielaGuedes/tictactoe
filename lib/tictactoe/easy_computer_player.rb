# frozen_string_literal: true

require_relative './computer_player'

module Tictactoe
  class EasyComputerPlayer < ComputerPlayer
    private

    def best_move
      random_spot
    end
  end
end
