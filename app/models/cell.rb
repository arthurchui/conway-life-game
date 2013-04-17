class Cell
  attr_accessor :coordinate

  def initialize(coordinate)
    self.coordinate = coordinate
  end

  def should_die?(neighbour_counts)
    neighbour_counts > 2
  end

  def here?(coordinate)
    self.coordinate == coordinate
  end
end
