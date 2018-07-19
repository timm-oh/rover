require 'test_helper'

module Rover
  class PositionTest < Minitest::Test

    def setup
      @start_x = 5
      @start_y = 5
      @position = Position.new(@start_x, @start_y)
    end

    def test_moving_north
      @position.move(Orientation::NORTH)
      assert_equal @start_y + 1, @position.y
      assert_equal @start_x, @position.x
    end

    def test_moving_south
      @position.move(Orientation::SOUTH)
      assert_equal @start_y - 1, @position.y
      assert_equal @start_x, @position.x
    end

    def test_moving_east
      @position.move(Orientation::EAST)
      assert_equal @start_y, @position.y
      assert_equal @start_x + 1, @position.x
    end

    def test_moving_west
      @position.move(Orientation::WEST)
      assert_equal @start_y, @position.y
      assert_equal @start_x - 1, @position.x
    end

    def test_raises_exception_if_not_valid_orientation
      assert_raises Position::InvalidOrientation do
        @position.move(nil)
      end
    end
  end
end