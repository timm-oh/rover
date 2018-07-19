require 'test_helper'

module Rover
  class RoverTest < Minitest::Test
    def setup
      @start_x = 0
      @start_y = 0
      @orientation = Orientation::NORTH
      @position    = Position.new(@start_x, @start_y)
      @rover = Rover.new(@position, @orientation)
    end

    def test_turn_right_changes_orientation
      @rover.turn_right
      assert_equal @orientation.right, @rover.orientation
    end

    def test_turn_left_changes_orientation
      @rover.turn_left
      assert_equal @orientation.left, @rover.orientation
    end

    def test_move
      @rover.move
      assert_equal @orientation, @rover.orientation
      assert_equal @start_x, @rover.position.x
      assert_equal @start_y + 1, @rover.position.y
    end
  end
end