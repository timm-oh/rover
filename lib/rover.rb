require "rover/version"
require "rover/orientation"
require "rover/position"
require "rover/rover"
require "rover/plateau"
require "rover/rovers_controller"

module Rover
  @show_prompts = ARGV.pop == '--prompts'
  puts 'Please enter the upper x and y bounds for the plateau' if @show_prompts
  x, y = *gets.chomp.split(' ').map(&:to_i)
  @plateau = Plateau.new(x, y)
  @controller = RoversController.new(@plateau)
  loop do
    puts 'Please enter the starting x and y points and orientation' if @show_prompts
    rover_x, rover_y, rover_orientation = *gets.chomp.split(' ')
    rover = Rover.new(Position.new(rover_x.to_i, rover_y.to_i), Orientation.from_string(rover_orientation))
    puts 'Please enter the rover instructions' if @show_prompts
    gets.chomp.each_char do |c|
      case c.upcase
      when 'L' then @controller.move_rover(:left, rover)
      when 'R' then @controller.move_rover(:right, rover)
      when 'M' then @controller.move_rover(:move, rover)
      end
    end
    if @show_prompts
      puts "Final rover position: #{rover.position.x} #{rover.position.y} #{rover.orientation}"
    else
      puts "#{rover.position.x} #{rover.position.y} #{rover.orientation}"
    end
  end
end