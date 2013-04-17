class Game
  attr_accessor :cells

  def initialize
    self.cells = []
  end

  def play_once
    new_cells = []

    self.cells.each do |cell|
      current_coordinate = cell.coordinate

      # check growth of neighbour
      current_coordinate.neighbour_coordinates.each do |coordinate|
        unless get_cell(self.cells, coordinate) || get_cell(new_cells, coordinate)
          counts = count_neighbour_cells(coordinate)
          if counts == 3
            new_cells << Cell.new(coordinate)
          end
        end
      end

      # check the next state of current cell
      counts = count_neighbour_cells(current_coordinate)
      new_cells << cell unless cell.should_die?(counts)
    end

    self.cells = new_cells
  end

  def count_neighbour_cells(coordinate)
    coordinate.neighbour_coordinates.map do |coordinate|
      get_cell(self.cells, coordinate)
    end.compact.size
  end


  private

  def get_cell(cells, coordinate)
    res = cells.select do |cell|
      cell.here?(coordinate)
    end
    res[0]
  end

end
