# frozen_string_literal: true

require_relative '../../../lib/tictactoe/game'
require_relative '../../../lib/tictactoe/human_vs_human_game'
require_relative '../../../lib/tictactoe/human_vs_computer_game'
require_relative '../../../lib/tictactoe/computer_vs_computer_game'
require_relative '../../../lib/tictactoe/computer_player'
require_relative '../../../lib/tictactoe/human_player'
require_relative '../../../lib/tictactoe/board'

RSpec.describe Tictactoe::Cli do
  describe '#start' do
    subject(:start) { described_class.new.start }

    context 'when HumanVsHuman game' do
      let(:mode) { '0' }

      it 'initializes HumanVsHumanGame' do
        allow(Utils::InputReceiver).to receive(:gets).and_return(mode)
        expect(Tictactoe::HumanVsHumanGame).to receive(:new).and_call_original
        expect_any_instance_of(Tictactoe::Game).to receive(:start)
        start
      end
    end

    context 'when HumanVsComputer game' do
      let(:mode) { '1' }

      context 'when selecting easy computer' do
        let(:difficult) { '0' }

        it 'initializes game with EasyComputerPlayer' do
          allow(Utils::InputReceiver).to receive(:gets).and_return(mode, difficult)
          expect(Tictactoe::HumanVsComputerGame).to receive(:new).with(difficult.to_i).and_call_original
          expect_any_instance_of(Tictactoe::Game).to receive(:start)
          start
        end
      end

      context 'when selecting medium computer' do
        let(:difficult) { '1' }

        it 'initializes game with MediumComputerPlayer' do
          allow(Utils::InputReceiver).to receive(:gets).and_return(mode, difficult)
          expect(Tictactoe::HumanVsComputerGame).to receive(:new).with(difficult.to_i).and_call_original
          expect_any_instance_of(Tictactoe::Game).to receive(:start)
          start
        end
      end

      context 'when selecting hard computer' do
        let(:difficult) { '2' }

        it 'initializes game with HardcomputerPlayer' do
          allow(Utils::InputReceiver).to receive(:gets).and_return(mode, difficult)
          expect(Tictactoe::HumanVsComputerGame).to receive(:new).with(difficult.to_i).and_call_original
          expect_any_instance_of(Tictactoe::Game).to receive(:start)
          start
        end
      end
    end

    context 'when ComputerVsComputer game' do
      let(:mode) { '2' }
      let(:difficult) { '0' }

      it 'initializes game with EasyComputerPlayer' do
        allow(Utils::InputReceiver).to receive(:gets).and_return(mode, difficult)
        expect(Tictactoe::ComputerVsComputerGame).to receive(:new).with(difficult.to_i).and_call_original
        expect_any_instance_of(Tictactoe::Game).to receive(:start)
        start
      end
    end
  end
end
