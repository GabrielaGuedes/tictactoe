# frozen_string_literal: true

require_relative '../utils/input_receiver'
require_relative './human_vs_human_game'
require_relative './human_vs_computer_game'
require_relative './computer_vs_computer_game'

module Tictactoe
  class Cli
    DIFFICULTS = %w[Easy Medium Hard].freeze
    MODES = %w[HumanVsHuman HumanVsComputer ComputerVsComputer].freeze

    attr_accessor :mode, :difficult

    def start
      select_mode
      select_difficult if mode_with_computer?
      eval("Tictactoe::#{MODES[mode]}Game").new(difficult).start
    end

    def select_mode
      message = "Select your mode: \n0. Human vs. Human\n1. Human vs. Computer\n2. Computer vs. Computer"
      mode_input = Utils::InputReceiver.valid_input(message) { |chosen_mode| !MODES[chosen_mode.to_i].nil? }
      @mode = mode_input.to_i
    end

    def select_difficult
      message = "\nSelect your difficult: \n0. Easy\n1. Medium\n2. Hard"
      difficult_input = Utils::InputReceiver.valid_input(message) do |chosen_difficult|
        !DIFFICULTS[chosen_difficult.to_i].nil?
      end
      @difficult = difficult_input.to_i
    end

    def mode_with_computer?
      MODES[mode].include? 'Computer'
    end
  end
end
