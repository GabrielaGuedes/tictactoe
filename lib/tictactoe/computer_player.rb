# frozen_string_literal: true

require_relative './player'
require_relative './board'

module Tictactoe
  class ComputerPlayer < Player
    private

    def spot
      return center_spot if board.center_spot_available?

      best_move
    end

    def best_move
      raise NotImplementedError
    end

    def smart_spot
      board.available_spots.each do |available_spot|
        return available_spot if self_wins_with_spot?(available_spot) || enemy_wins_with_spot?(available_spot)

        reset_board(available_spot)
      end

      nil
    end

    def random_spot
      board.random_available_spot
    end

    def self_wins_with_spot?(available_spot)
      fill_spot(available_spot)
      board.game_is_over_with_winner?
    end

    def enemy_wins_with_spot?(available_spot)
      board.fill_spot(available_spot, other_player_marker)
      board.game_is_over_with_winner?
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
