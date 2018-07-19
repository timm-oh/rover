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

    def eql?(rover)
      return false unless rover.kind_of? Rover
      self.position.x == rover.position.x &&
      self.position.y == rover.position.y &&
      self.orientation == rover.orientation
    end

    def hash
      self.position.x.hash ^ self.position.y.hash ^ self.orientation.hash
    end
  end
end