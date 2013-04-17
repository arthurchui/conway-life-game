class Coordinate
  attr_accessor :position

  def initialize(val)
    self.position = val
  end

  def neighbour_coordinates
    neighbour_positions.map { |position| Coordinate.new(position) }
  end

  def neighbour_positions
    xs = neighbour_ranges.map(&:to_a)
    xs[0].product(*xs[1..-1]).delete_if { |position| position == self.position }
  end

  def neighbour_ranges
    self.position.map { |v| (v-1..v+1) }
  end

  def ==(coordinate)
    self.position == coordinate.position
  end
end
