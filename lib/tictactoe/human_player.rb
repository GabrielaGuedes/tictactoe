# frozen_string_literal: true

require_relative './player'
require_relative '../utils/input_receiver'

module Tictactoe
  class HumanPlayer < Player
    VALID_INPUT_REGEX = /^[0-8]{1}$/.freeze

    private

    def spot
      message = 'Enter [0-8]:'
      spot_input = Utils::InputReceiver.valid_input(message) { |chosen_spot| valid_spot(chosen_spot) }
      spot_input.to_i
    end

    def valid_spot(chosen_spot)
      board.empty_spot?(chosen_spot.to_i) && chosen_spot =~ VALID_INPUT_REGEX
    end
  end
end
