require_relative '../../../lib/tictactoe/board.rb'

RSpec.describe Tictactoe::Board do
  let(:board) { described_class.new }

  describe '#empty_spot?' do
    subject(:empty_spot) { board.empty_spot?(index) }

    context 'when position is filled' do
      let(:index) { 7 }

      before do
        board.fill_spot(index, 'X')
      end

      it 'returns false' do
        expect(empty_spot).to eq(false)
      end
    end
    
    context 'when position is not filled' do
      let(:index) { 7 }

      it 'returns true' do
        expect(empty_spot).to eq(true)
      end
    end
  end

  describe '#fill_spot' do
    subject(:fill_spot) { board.fill_spot(index, marker) }
    let(:index) { 2 }
    let(:marker) { 'X' }

    it 'fills the spot' do
      fill_spot
      expect(board.to_a[index]).to eq(marker)
    end
  end

  describe '#to_a' do
    subject(:to_a) { board.to_a }

    it 'transforms the board into an array' do
      expect(to_a[1]).to eq('1')
    end
  end

  describe '#center_spot_available?' do
    subject(:center_spot_available) { board.center_spot_available? }

    context 'when it is filled' do
      before do
        board.fill_spot(Tictactoe::Board::CENTER_SPOT_INDEX, 'X')
      end

      it 'returns false' do
        expect(center_spot_available).to eq(false)
      end      
    end

    context 'when it is not filled' do
      it 'returns true' do
        expect(center_spot_available).to eq(true)
      end
    end
  end

  describe '#game_is_over_with_winner?' do
    subject(:game_is_over_with_winner) { board.game_is_over_with_winner? }

    context 'when a player has won through row' do
      before do
        board.fill_spot(0, 'X')
        board.fill_spot(1, 'X')
        board.fill_spot(2, 'X')
      end

      it 'returns true' do
        expect(game_is_over_with_winner).to eq(true)
      end
    end

    context 'when a player has won through column' do
      before do
        board.fill_spot(0, 'X')
        board.fill_spot(3, 'X')
        board.fill_spot(6, 'X')
      end

      it 'returns true' do
        expect(game_is_over_with_winner).to eq(true)
      end
    end

    context 'when a player has won through diagonal' do
      before do
        board.fill_spot(0, 'X')
        board.fill_spot(4, 'X')
        board.fill_spot(8, 'X')
      end

      it 'returns true' do
        expect(game_is_over_with_winner).to eq(true)
      end
    end

    context 'when a player has won through inverse_diagonal' do
      before do
        board.fill_spot(2, 'X')
        board.fill_spot(4, 'X')
        board.fill_spot(6, 'X')
      end

      it 'returns true' do
        expect(game_is_over_with_winner).to eq(true)
      end
    end

    context 'when game has just begun' do
      it 'returns false' do
        expect(game_is_over_with_winner).to eq(false)
      end
    end

    context 'when board is all filled but without winner' do
      before do
        board.fill_spot(0, 'X')
        board.fill_spot(1, 'O')
        board.fill_spot(2, 'X')
        board.fill_spot(3, 'X')
        board.fill_spot(4, 'X')
        board.fill_spot(5, 'O')
        board.fill_spot(6, 'O')
        board.fill_spot(7, 'X')
        board.fill_spot(8, 'O')
      end

      it 'returns false' do
        expect(game_is_over_with_winner).to eq(false)
      end
    end
  end

  describe '#tie?' do
    subject(:tie) { board.tie? }

    context 'when board is not yet fulfilled' do
      it 'returns false' do
        expect(tie).to eq(false)
      end
    end

    context 'when board is fulfilled' do
      before do
        board.fill_spot(0, 'X')
        board.fill_spot(1, 'O')
        board.fill_spot(2, 'X')
        board.fill_spot(3, 'X')
        board.fill_spot(4, 'X')
        board.fill_spot(5, 'O')
        board.fill_spot(6, 'O')
        board.fill_spot(7, 'X')
        board.fill_spot(8, 'O')
      end

      it 'returns true' do
        expect(tie).to eq(true)
      end
    end
  end

  describe '#available_spots' do
    subject(:available_spots) { board.available_spots }
    let(:board_size) { 9 }

    context 'when board is all empty' do
      it 'returns all the spots' do
        expect(available_spots.length).to eq(board_size)
      end
    end

    context 'when board is partially filled' do
      let(:number_of_spots_filled) { 5 }

      before do
        board.fill_spot(0, 'X')
        board.fill_spot(1, 'O')
        board.fill_spot(2, 'X')
        board.fill_spot(6, 'O')
        board.fill_spot(8, 'O')
      end

      it 'returns only available spots' do
        expect(available_spots.length).to eq(board_size - number_of_spots_filled)
      end
    end

    context 'when board is fulfilled' do
      before do
        board.fill_spot(0, 'X')
        board.fill_spot(1, 'O')
        board.fill_spot(2, 'X')
        board.fill_spot(3, 'X')
        board.fill_spot(4, 'X')
        board.fill_spot(5, 'O')
        board.fill_spot(6, 'O')
        board.fill_spot(7, 'X')
        board.fill_spot(8, 'O')
      end

      it 'returns 0' do
        expect(available_spots.length).to eq(0)
      end
    end
  end
end
