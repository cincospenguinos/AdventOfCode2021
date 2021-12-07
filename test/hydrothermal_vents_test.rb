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

  def test_first_example_works
    vents = AdventOfCode2021::HydrothermalVents.new(EXAMPLE_INPUT)
    assert_equal 5, vents.overlapping_segments(2)
  end

  def test_first_day_works
    vents = AdventOfCode2021::HydrothermalVents.new(DAY_FIVE_INPUT)
    assert_equal 5774, vents.overlapping_segments(2)
  end

  def test_first_example_part_two
    skip 'Giving up on part two'
    vents = AdventOfCode2021::HydrothermalVents.new(EXAMPLE_INPUT)
    assert_equal 12, vents.overlapping_segments(2, true)
  end

  private

  def test_point(x, y)
    OpenStruct.new(x: x, y: y)
  end
end