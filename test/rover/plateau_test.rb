require 'test_helper'

module Rover
  class PlateauTest < Minitest::Test
    def setup
      @upper_bound_x = 5
      @upper_bound_y = 5
      @plateau = Plateau.new(@upper_bound_x, @upper_bound_y)
    end

    def test_valid_position_on_plateau
      position = Position.new(@upper_bound_x - 1, @upper_bound_y - 1)
      assert @plateau.valid_position?(position)
    end

    def test_invalid_x_position_on_plateau
      position = Position.new(@upper_bound_x + 1, @upper_bound_y)
      refute @plateau.valid_position?(position)
    end

    def test_invalid_y_position_on_plateau
      position = Position.new(@upper_bound_x, @upper_bound_y + 1)
      refute @plateau.valid_position?(position)
    end

    def test_edge_positions_are_valid
      position = Position.new(@upper_bound_x, @upper_bound_y)
      assert @plateau.valid_position?(position)
    end

    def test_origin_positions_are_valid
      position = Position.new(0, 0)
      assert @plateau.valid_position?(position)
    end
  end
end