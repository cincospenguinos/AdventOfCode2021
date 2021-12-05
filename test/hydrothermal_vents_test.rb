require 'test_helper'

class HydrothermalVentsTest < Minitest::Test
  EXAMPLE_INPUT = <<~VENTS
    0,9 -> 5,9
    8,0 -> 0,8
    9,4 -> 3,4
    2,2 -> 2,1
    7,0 -> 7,4
    6,4 -> 2,0
    0,9 -> 2,9
    3,4 -> 1,4
    0,0 -> 8,8
    5,5 -> 8,2
  VENTS

  DAY_FIVE_INPUT = File.open('test/test_data/day_five.txt', 'r', &:read)

  def test_segment_indicates_horizontal
    segment = AdventOfCode2021::HydrothermalSegment.new(test_point(0, 0), test_point(0, 1))
    assert segment.horizontal?
    refute segment.vertical?
  end

  def test_segment_indicates_vertical
    segment = AdventOfCode2021::HydrothermalSegment.new(test_point(0, 0), test_point(1, 0))
    refute segment.horizontal?
    assert segment.vertical?
  end

  def test_segment_indicates_neither
    segment = AdventOfCode2021::HydrothermalSegment.new(test_point(0, 0), test_point(1, 1))
    refute segment.horizontal?
    refute segment.vertical?
  end

  def test_grid_works
    segment = AdventOfCode2021::HydrothermalSegment.new(test_point(0, 0), test_point(0, 2))
    grid = AdventOfCode2021::HydrothermalGrid.new(3)
    grid.add(segment)

    assert_equal 1, grid.grid[0][0]
    assert_equal 1, grid.grid[0][1]
    assert_equal 1, grid.grid[0][2]
    assert_equal 0, grid.grid[1][0]
  end

  def test_first_example_works
    vents = AdventOfCode2021::HydrothermalVents.new(EXAMPLE_INPUT)
    assert_equal 5, vents.overlapping_segments(2)
  end

  def test_first_day_works
    vents = AdventOfCode2021::HydrothermalVents.new(DAY_FIVE_INPUT)
    assert_equal 5774, vents.overlapping_segments(2)
  end

  private

  def test_point(x, y)
    OpenStruct.new(x: x, y: y)
  end
end