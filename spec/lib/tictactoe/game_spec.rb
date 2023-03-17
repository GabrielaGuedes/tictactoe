require_relative '../../../lib/tictactoe/game.rb'
require_relative '../../../lib/tictactoe/computer_player.rb'
require_relative '../../../lib/tictactoe/human_player.rb'
require_relative '../../../lib/tictactoe/board.rb'

RSpec.describe Game do
  describe '#start' do
    let(:game) { described_class.new }
    let(:specific_inputs) { %w[0 1 3] }

    subject(:empty_spot) { board.empty_spot?(index) }

    it 'finishes the game after 3 rounds (with specific inputs)' do
      allow_any_instance_of(Tictactoe::HumanPlayer).to receive(:gets).and_return(*specific_inputs)
      game.start
      expect(game.board.game_is_over_with_winner? || game.board.tie?).to eq(true)            
    end
  end

  describe '#initialize' do
    subject(:intialize_game) { described_class.new }

    it 'intanciates the board and two players' do
      expect(Tictactoe::Board).to receive(:new)
      expect(Tictactoe::HumanPlayer).to receive(:new)
      expect(Tictactoe::ComputerPlayer).to receive(:new)
      intialize_game
    end
  end
end
