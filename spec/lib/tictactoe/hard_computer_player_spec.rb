require_relative '../../../lib/tictactoe/hard_computer_player.rb'
require_relative '../../../lib/tictactoe/board.rb'

RSpec.describe Tictactoe::HardComputerPlayer do
  let(:marker) { Tictactoe::Board::MARKERS[0] }
  let(:other_marker) { Tictactoe::Board::MARKERS[1] }
  let(:board) { Tictactoe::Board.new }
  let(:computer_player) { described_class.new(marker, board) }

  describe '#play_turn' do
    context 'when computer is about to win' do
      let(:spot) { '2' }

      subject(:play_turn) { computer_player.play_turn }

      before do
        board.fill_spot(0, marker)            #  X  X  .
        board.fill_spot(1, marker)            #  .  O  .
        board.fill_spot(4, other_marker)      #  .  O  .
        board.fill_spot(7, other_marker)
      end

      it 'wins the game' do
        expect { play_turn }.to change { board.to_a[spot.to_i] }.to(marker)
        expect(board.game_is_over_with_winner?).to eq(true)
      end
    end

    context 'when other player is about to win' do
      let(:spot) { '2' }

      subject(:play_turn) { computer_player.play_turn }

      before do
        board.fill_spot(0, marker)        #  X  .  .
        board.fill_spot(4, marker)        #  .  X  O
        board.fill_spot(5, other_marker)  #  .  .  O
        board.fill_spot(8, other_marker)
      end

      it 'prevents the enemy of winning the game' do
        expect { play_turn }.to change { board.to_a[spot.to_i] }.to(marker)
        expect(board.game_is_over_with_winner?).to eq(false)
      end
    end

    context 'when no one is about to win' do
      subject(:play_turn) { computer_player.play_turn }

      it 'just fills a random spot' do
        expect { play_turn }.to change { board.available_spots.length }.by(-1)
      end
    end
  end
end
