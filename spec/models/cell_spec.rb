require 'spec_helper'

describe Cell do
  let(:coordinate) { Coordinate.new [0,0] }
  let(:cell) { Cell.new(coordinate) }

  it "#should_die?" do
    cell.should_die?(2).should be_false
    cell.should_die?(3).should be_true
  end

  it "#here?" do
    coordinate = Coordinate.new [0, 0]
    cell.here?(coordinate).should be_true

    coordinate = Coordinate.new [0, 1]
    cell.here?(coordinate).should be_false
  end
end
