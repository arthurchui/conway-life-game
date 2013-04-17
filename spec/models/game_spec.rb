require 'spec_helper'

describe Game do
  let(:coordinate) { Coordinate.new [0, 0] }
  let(:cell) { Cell.new coordinate }
  let(:game) {
    game = Game.new
    game.cells << cell
    game
  }

  context "with 1 cell" do
    it "#count_neighbour_cells" do
      game.count_neighbour_cells(coordinate).should == 0
    end

    it "all cells should die" do
      game.play_once
      game.cells.size.should == 1
    end
  end

  context "with 3 cells" do
    let(:game) {
      game = Game.new
      game.cells << Cell.new(Coordinate.new [0, 0])
      game.cells << Cell.new(Coordinate.new [1, 0])
      game.cells << Cell.new(Coordinate.new [0, 1])
      game
    }

    it "#count_neighbour_cells" do
      coordinate = Coordinate.new [1, 1]
      game.count_neighbour_cells(coordinate).should == 3
    end

    it "should reproduce a new cell" do
      game.play_once
      game.cells.size.should == 4
    end
  end

  context "with 9 cells" do
    let(:game) {
      game = Game.new
      game.cells << Cell.new(Coordinate.new [0, 0])
      game.cells << Cell.new(Coordinate.new [0, 1])
      game.cells << Cell.new(Coordinate.new [0, -1])
      game.cells << Cell.new(Coordinate.new [1, 0])
      game.cells << Cell.new(Coordinate.new [1, 1])
      game.cells << Cell.new(Coordinate.new [1, -1])
      game.cells << Cell.new(Coordinate.new [-1, 0])
      game.cells << Cell.new(Coordinate.new [-1, 1])
      game.cells << Cell.new(Coordinate.new [-1, -1])
      game
    }

    it "#count_neighbour_cells" do
      coordinate = Coordinate.new [0, 0]
      game.count_neighbour_cells(coordinate).should == 8
    end

    it "#play" do
      game.play_once
      game.cells.size.should == 4
    end
  end

end
