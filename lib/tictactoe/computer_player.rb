require_relative './player.rb'
require_relative './board.rb'

module Tictactoe
  class ComputerPlayer < Player

    private

    def spot
      return center_spot if board.center_spot_available?

      get_best_move
    end

    def get_best_move
      board.available_spots.each do |available_spot|
        return available_spot if self_wins_with_spot?(available_spot) || enemy_wins_with_spot?(available_spot)

        reset_board(available_spot)
      end

      board.random_available_spot      
    end

    def self_wins_with_spot?(available_spot)
      fill_spot(available_spot)
      return board.game_is_over_with_winner?
    end

    def enemy_wins_with_spot?(available_spot)
      board.fill_spot(available_spot, other_player_marker)
      return board.game_is_over_with_winner?
    end

    def reset_board(available_spot)
      board.fill_spot(available_spot, available_spot.to_s)
    end

    def other_player_marker
      (Tictactoe::Board::MARKERS - [marker]).first
    end

    def center_spot
      Tictactoe::Board::CENTER_SPOT_INDEX
    end
  end
end
