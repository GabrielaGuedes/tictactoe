# frozen_string_literal: true

require_relative '../../../lib/utils/input_receiver'

RSpec.describe Utils::InputReceiver do
  let(:desired_input) { 'a' }
  let(:message) { 'Enter your input' }
  subject(:valid_input) { described_class.valid_input(message) { |i| i == desired_input } }

  describe '#self.valid_input' do
    context 'when provided input is valid' do
      it 'returns the input' do
        allow(described_class).to receive(:gets).and_return(desired_input)
        expect(valid_input).to eq(desired_input)
      end
    end

    context 'when input is not valid' do
      let(:wrong_input) { 'b' }

      it 'asks another input' do
        allow(described_class).to receive(:gets).and_return(wrong_input, desired_input)
        expect(valid_input).to eq(desired_input)
      end
    end
  end
end
