# frozen_string_literal: true

require_relative '../../../lib/tictactoe/player'
require_relative '../../../lib/tictactoe/board'

RSpec.describe Tictactoe::Player do
  describe '#initialize' do
    let(:marker) { Tictactoe::Board::MARKERS[1] }
    let(:board) { Tictactoe::Board.new }
    subject(:new_player) { described_class.new(marker, board, 1) }

    it 'assign the variables correctly' do
      expect(new_player.marker).to eq(marker)
      expect(new_player.board).to eq(board)
    end
  end
end
