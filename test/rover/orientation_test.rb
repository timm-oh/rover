require 'test_helper'

module  Rover
  class OrientationTest < Minitest::Test
  
    %w(N E S W).each do |s|
      define_method "test_#{s}_maps_to_an_orientation" do
        o = Orientation.from_string(s)
        assert_kind_of Orientation, o

        refute_equal o, o.left
        refute_equal o, o.right

        assert_equal o, o.left.right
        assert_equal o, o.right.left
        assert_equal o, o.right.right.right.right
        assert_equal o, o.left.left.left.left
      end
    end

  end
end