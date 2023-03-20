# frozen_string_literal: true

require_relative '../../../lib/tictactoe/game'
require_relative '../../../lib/tictactoe/board'

RSpec.describe Tictactoe::Game do
  describe '#initialize' do
    subject(:initialize_game) { described_class.new(0) }

    it 'initializes the board' do
      expect(Tictactoe::Board).to receive(:new)
      initialize_game
    end
  end
end
