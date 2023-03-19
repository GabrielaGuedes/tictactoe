require_relative '../../../lib/tictactoe/medium_computer_player.rb'
require_relative '../../../lib/tictactoe/board.rb'

RSpec.describe Tictactoe::MediumComputerPlayer do
  let(:marker) { Tictactoe::Board::MARKERS[0] }
  let(:board) { Tictactoe::Board.new }
  let(:computer_player) { described_class.new(marker, board) }

  describe '#play_turn' do
    subject(:play_turn) { computer_player.play_turn }

    it 'just fills an available spot' do
      expect { play_turn }.to change { board.available_spots.length }.by(-1)
    end
  end
end
