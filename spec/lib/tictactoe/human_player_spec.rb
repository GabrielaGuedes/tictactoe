require_relative '../../../lib/tictactoe/human_player.rb'
require_relative '../../../lib/tictactoe/board.rb'

RSpec.describe Tictactoe::HumanPlayer do
  let(:marker) { Tictactoe::Board::MARKERS[1] }
  let(:board) { Tictactoe::Board.new }
  let(:human_player) { described_class.new(marker, board) }

  describe '#play_turn' do
    context 'when valid spot' do
      let(:spot) { '2' }

      subject(:play_turn) { human_player.play_turn }

      it 'fills the board correctly' do
        allow(human_player).to receive(:gets).and_return(spot)
        expect { play_turn }.to change { board.to_a[spot.to_i] }.to(marker)
      end
    end

    context 'when spot is busy' do
      let(:busy_spot) { '2' }
      let(:correct_spot) { '3' }

      subject(:play_turn) { human_player.play_turn }

      before do
        board.fill_spot(busy_spot.to_i, marker)
      end

      it 'asks the input again and fill the other [correct] spot' do
        allow(human_player).to receive(:gets).and_return(busy_spot, correct_spot)
        expect { play_turn }.to change { board.to_a[correct_spot.to_i] }.to(marker)        
      end
    end
  end
end
