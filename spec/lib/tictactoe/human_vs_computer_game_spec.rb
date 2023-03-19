# frozen_string_literal: true

require_relative '../../../lib/tictactoe/human_vs_computer_game'
require_relative '../../../lib/tictactoe/hard_computer_player'
require_relative '../../../lib/tictactoe/human_player'
require_relative '../../../lib/tictactoe/board'

RSpec.describe Tictactoe::HumanVsComputerGame do
  describe '#initialize' do
    subject(:intialize_game) { described_class.new(2) }

    it 'intanciates the board and two players' do
      expect(Tictactoe::Board).to receive(:new)
      expect(Tictactoe::HumanPlayer).to receive(:new)
      expect(Tictactoe::HardComputerPlayer).to receive(:new)
      intialize_game
    end
  end

  describe '#start' do
    let(:human_vs_computer_game) { Tictactoe::HumanVsComputerGame.new(2) }
    let(:specific_inputs) { %w[0 1 3] }

    it 'finishes the game after 3 rounds (with specific inputs)' do
      allow_any_instance_of(Tictactoe::HumanPlayer).to receive(:gets).and_return(*specific_inputs)
      human_vs_computer_game.start
      expect(human_vs_computer_game.board.game_is_over_with_winner? || human_vs_computer_game.board.tie?).to eq(true)
    end
  end
end
