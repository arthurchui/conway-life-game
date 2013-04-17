require 'spec_helper'

describe Coordinate do
  context "two-dimensional coodinate" do
    let(:coordinate) { Coordinate.new [0,0] }

    it "#neighbour_ranges" do
      ranges = coordinate.neighbour_ranges
      ranges.size.should == 2
      ranges.should include((-1..1))
    end

    it "#neighbour_positions" do
      positions = coordinate.neighbour_positions
      positions.should == [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
    end

    it "#neighbour_coordinates" do
      coordinate.neighbour_coordinates.size.should == 8
    end

    it "#==" do
      c1 = Coordinate.new [0, 0]
      c2 = Coordinate.new [0, 1]
      (c1 == coordinate).should be_true
      (c2 == coordinate).should be_false
    end
  end
end
