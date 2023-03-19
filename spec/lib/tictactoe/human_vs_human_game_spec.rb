# frozen_string_literal: true

require_relative '../../../lib/tictactoe/human_vs_human_game'
require_relative '../../../lib/tictactoe/human_player'
require_relative '../../../lib/tictactoe/board'

RSpec.describe Tictactoe::HumanVsHumanGame do
  describe '#initialize' do
    subject(:intialize_game) { described_class.new(nil) }

    it 'intanciates the board and two players' do
      expect(Tictactoe::Board).to receive(:new)
      expect(Tictactoe::HumanPlayer).to receive(:new).twice
      intialize_game
    end
  end

  describe '#start' do
    let(:human_vs_human_game) { Tictactoe::HumanVsHumanGame.new(nil) }
    let(:specific_inputs) { %w[0 3 1 7 2] } #  O  O  O
    #  .  .  .
    #  X  X  .

    it 'finishes the game after 3 rounds (with specific inputs)' do
      allow_any_instance_of(Tictactoe::HumanPlayer).to receive(:gets).and_return(*specific_inputs)
      human_vs_human_game.start
      expect(human_vs_human_game.board.game_is_over_with_winner? || human_vs_human_game.board.tie?).to eq(true)
    end
  end
end
