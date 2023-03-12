require_relative '../../../lib/utils/matrix.rb'

RSpec.describe Utils::Matrix do
  let(:matrix) { described_class[%w[0 1 2], %w[3 4 5], %w[6 7 8]] }

  describe '#assign_value_to_array_position' do
    subject(:assign) { matrix.assign_value_to_array_position(value, position) }

    context 'when position is a valid index' do
      let(:position) { 7 }
      let(:value) { 60 }

      it 'returns the number in the desired position of matrix' do
        assign
        expect(matrix.value_at_array_position(position)).to eq(value)
      end
    end
    
    context 'when position is bigger than the matrix' do
      let(:position) { 12 }
      let(:value) { 60 }

      it 'returns nil' do
        expect { assign }.to raise_error(IndexError)
      end
    end
  end

  describe '#value_at_array_position' do
    subject(:value) { matrix.value_at_array_position(position) }

    context 'when position is a valid index' do
      let(:position) { 7 }

      it 'returns the number in the desired position of matrix' do
        expect(value).to eq('7')
      end
    end
    
    context 'when position is bigger than the matrix' do
      let(:position) { 12 }

      it 'returns nil' do
        expect(value).to eq(nil)
      end
    end
    
    context 'when position is 0' do
      let(:position) { 0 }

      it 'returns the number in the desired position of matrix' do
        expect(value).to eq('0')
      end
    end
  end

  describe '#diagonal_vectors' do
    subject(:diagonal_vectors) { matrix.diagonal_vectors }

    it 'returns the diagonals in an array of two arrays' do
      expect(diagonal_vectors).to eq([%w[0 4 8], %w[2 4 6]])
    end
  end

  describe '#each' do
    context 'when block is given' do
      subject(:each) { matrix.each(which) { |i|  items << i } }

      context 'when "which" is inverse_diagonal' do
        let(:which) { :inverse_diagonal }
        let(:items) { '' }

        it 'calls each element of the desired "which"' do
          each
          expect(items).to eq('246')
        end
      end

      context 'when "which" is all' do
        let(:which) { :all }
        let(:items) { '' }

        it 'calls each element of the desired "which"' do
          each
          expect(items).to eq('012345678')
        end
      end
    end

    context 'when block is not given' do
      let(:which) { :inverse_diagonal }
      subject(:each) { matrix.each(which) }

      it 'returns an enumerator that allows to convert the result into an array' do
        expect(each.to_a).to eq(%w[2 4 6])
      end
    end
  end
end
