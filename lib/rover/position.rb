module Rover
  class Position
    attr_reader :x, :y

    def initialize(x = 0, y = 0)
      @x = x
      @y = y
    end

    def move(orientation)
      case orientation
      when Orientation::North then @y += 1
      when Orientation::East  then @x += 1
      when Orientation::South then @y -= 1
      when Orientation::West  then @x -= 1
      else raise InvalidOrientation.new(orientation)
      end
    end

    class InvalidOrientation < StandardError
      def initialize(orientation)
        super("#{orientation} is not on the compass!")
      end
    end
  end
end