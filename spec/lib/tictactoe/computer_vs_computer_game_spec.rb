require_relative '../../../lib/tictactoe/computer_vs_computer_game.rb'
require_relative '../../../lib/tictactoe/hard_computer_player.rb'
require_relative '../../../lib/tictactoe/human_player.rb'
require_relative '../../../lib/tictactoe/board.rb'

RSpec.describe Tictactoe::ComputerVsComputerGame do
  describe '#initialize' do
    subject(:intialize_game) { described_class.new(2) }

    it 'intanciates the board and two players' do
      expect(Tictactoe::Board).to receive(:new)
      expect(Tictactoe::HardComputerPlayer).to receive(:new).twice
      intialize_game
    end
  end

  describe '#start' do
    let(:computer_vs_computer_game) { Tictactoe::ComputerVsComputerGame.new(2) }

    it 'finishes the game after some rounds' do
      computer_vs_computer_game.start
      expect(computer_vs_computer_game.board.game_is_over_with_winner? || computer_vs_computer_game.board.tie?).to eq(true)            
    end
  end
end
