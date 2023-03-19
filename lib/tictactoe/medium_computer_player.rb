# frozen_string_literal: true

require_relative './computer_player'

module Tictactoe
  class MediumComputerPlayer < ComputerPlayer
    private

    def best_move
      return random_spot if should_perform_easy_move?

      smart_spot || random_spot
    end

    def should_perform_easy_move?
      rand(1..10) < 5
    end
  end
end
