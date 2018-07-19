module Rover
  class RoversController
    def initialize(plateau = Plateau.new)
      @plateau = plateau
    end

    def move_rover(instruction, rover)
      if @plateau.valid?
        case Instruction.from_string(instruction)
        when :left  then rover.turn_left
        when :right then rover.turn_right
        when :move  then check_valid_rover_movement(rover)
        end
      end
    end
    
    class OutOfBoundsError < StandardError
      def initialize(rover, new_position)
        super("Rover: #{rover} cannot move to #{new_position} because it is out of bounds")
      end
    end

    private

    class Instruction
      VALID_INSTRUCTIONS = {
        'L' => :left,
        'R' => :right,
        'M' => :move
      }
  
      def self.from_string(instruction)
        VALID_INSTRUCTIONS[instruction.upcase] || :none
      end
    end
    
    def check_valid_rover_movement(rover)
      new_position = rover.position.dup
      new_position.move(rover.orientation)
      if @plateau.valid_position?(new_position)
        rover.move
      else
        raise OutOfBoundsError.new(rover, new_position)
      end
    end

  end
end