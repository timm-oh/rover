module Rover
  class Orientation

    def right
      raise 'not implemented'
    end

    def left
      raise 'not implemented'
    end

    class North < Orientation
      def right
        EAST
      end

      def left
        WEST
      end
    end

    class South < Orientation
      def right
        WEST
      end

      def left
        EAST
      end
    end

    class East < Orientation
      def right
        SOUTH
      end

      def left
        NORTH
      end
    end

    class West < Orientation
      def right
        NORTH
      end

      def left
        SOUTH
      end
    end

    NORTH = North.new
    SOUTH = South.new
    EAST  = East.new
    WEST  = West.new

    FROM_STRING = {
      'N' => NORTH,
      'S' => SOUTH,
      'E' => EAST,
      'W' => WEST
    }

    def self.from_string(s)
      FROM_STRING[s.to_s.upcase] or raise "Not an orientation: #{s}"
    end
  end
end