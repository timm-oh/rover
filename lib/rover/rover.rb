module Rover
  class Rover
    attr_reader :position, :orientation

    def initialize(position = Position.new(0, 0), orientation = Orientation::NORTH)
      raise IllegalArguementError unless position.kind_of?(Position) && orientation.kind_of?(Orientation)
      @position = position
      @orientation = orientation
    end

    def turn_right
      @orientation = @orientation.right
    end

    def turn_left
      @orientation = @orientation.left
    end

    def move
      @position.move(@orientation)
    end
  end
end