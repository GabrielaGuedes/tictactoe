require_relative '../../../lib/tictactoe/computer_player'
require_relative '../../../lib/tictactoe/board'

RSpec.describe Tictactoe::ComputerPlayer do
  let(:marker) { Tictactoe::Board::MARKERS[0] }
  let(:other_marker) { Tictactoe::Board::MARKERS[1] }
  let(:board) { Tictactoe::Board.new }
  let(:computer_player) { described_class.new(marker, board) }
  let(:center_spot) { Tictactoe::Board::CENTER_SPOT_INDEX }
  subject(:play_turn) { computer_player.play_turn }

  describe '#play_turn' do
    context 'when center spot is filled' do
      before do
        board.fill_spot(center_spot, other_marker)
      end

      it 'raises not implemented error' do
        expect { play_turn }.to raise_error(NotImplementedError)
      end
    end

    context 'when center spot is not yet filled' do
      it 'fills center spot' do
        expect { play_turn }.to change { board.to_a[center_spot] }.to(marker)
      end
    end
  end
end
