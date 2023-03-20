# frozen_string_literal: true

require_relative '../../../lib/tictactoe/easy_computer_player'
require_relative '../../../lib/tictactoe/board'

RSpec.describe Tictactoe::EasyComputerPlayer do
  let(:marker) { Tictactoe::Board::MARKERS[0] }
  let(:board) { Tictactoe::Board.new }
  let(:computer_player) { described_class.new(marker, board, 1) }

  describe '#play_turn' do
    subject(:play_turn) { computer_player.play_turn }

    it 'just fills a random spot' do
      expect { play_turn }.to change { board.available_spots.length }.by(-1)
    end
  end
end
