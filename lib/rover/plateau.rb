module Rover
  class Plateau
    def initialize(upper_bound_x = 5, upper_bound_y = 5)
      raise IllegalArguementError unless upper_bound_x > 0 && upper_bound_y > 0
      @upper_bound_x = upper_bound_x
      @upper_bound_y = upper_bound_y
    end

    def valid_position?(position)
      valid_x_position(position.x) && valid_y_position(position.y)
    end

    private

    def valid_x_position(x)
      x <= @upper_bound_x && x >= 0
    end

    def valid_y_position(y)
      y <= @upper_bound_y && y >= 0
    end
  end
end