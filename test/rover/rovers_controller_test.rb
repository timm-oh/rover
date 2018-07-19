require 'test_helper'

module Rover
  class RoversControllerTest < Minitest::Test
    def setup
      @rover = Rover.new(Position.new(0, 0))
      @plateau = Plateau.new(5, 5)
      @controller = RoversController.new(@plateau)
    end

    def test_left_instruction_turns_rover_left
      @controller.move_rover(:left, @rover)
      assert_equal Orientation::WEST, @rover.orientation
    end

    def test_right_instruction_turns_rover_right
      @controller.move_rover(:right, @rover)
      assert_equal Orientation::EAST, @rover.orientation
    end

    def test_move_instruction_to_a_valid_position
      @controller.move_rover(:move, @rover)
      assert_equal 1, @rover.position.y
      assert_equal 0, @rover.position.x
    end

    def test_move_instruction_to_a_invalid_position
      @rover = Rover.new(Position.new(5, 5))
      assert_raises RoversController::OutOfBoundsError do
        @controller.move_rover(:move, @rover)
      end
    end
  end
end