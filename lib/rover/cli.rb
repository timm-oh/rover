module Rover
  class CLI

    CACHE = { }

    def initialize(show_prompts = false)
      @show_prompts = show_prompts
    end
    
    def show_prompts?
      @show_prompts
    end

    def run
      puts 'Please enter the upper x and y bounds for the plateau' if show_prompts?
      x, y = *gets.chomp.split(' ').map(&:to_i)
      controller = RoversController.new(Plateau.new(x, y))
      loop do
        puts 'Please enter the starting x and y points and orientation' if show_prompts?
        line = gets&.chomp
        break if line.nil? || line.empty?
        rover_x, rover_y, rover_orientation = *line.split(' ')
        rover = Rover.new(Position.new(rover_x.to_i, rover_y.to_i), Orientation.from_string(rover_orientation))
        puts 'Please enter the rover instructions' if show_prompts?
        instructions = gets.chomp
        result = CACHE[rover.hash]&.[](instructions)
        if result
          puts 'Stored result'
          puts "#{result[0]} #{result[1]} #{result[2]}"
        else
          hash_before = rover.hash
          instructions.each_char do |c|
            controller.move_rover(c, rover)
          end
          CACHE.merge!(hash_before => { instructions => [ rover.position.x, rover.position.y, rover.orientation ] })
          if show_prompts?
            puts "Final rover position: #{rover.position.x} #{rover.position.y} #{rover.orientation}"
          else
            puts "#{rover.position.x} #{rover.position.y} #{rover.orientation}"
          end
        end
      end
    end

    def self.start
      cli = self.new(ARGV.pop == '--prompts')
      cli.run
    end
  end
end
