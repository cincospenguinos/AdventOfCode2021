require 'test_helper'

class HeightMapTest < Minitest::Test
  EXAMPLE_INPUT = <<~INPUT
    2199943210
    3987894921
    9856789892
    8767896789
    9899965678
  INPUT

  DAY_NINE_INPUT = File.open('test/test_data/day_nine.txt', 'r', &:read)

  def test_height_map_handles_example_risk
    map = AdventOfCode2021::HeightMap.new(EXAMPLE_INPUT)
    assert_equal [1, 0, 5, 5], map.risk_levels
    assert_equal 15, map.risk_level_sum
  end

  def test_height_map_handles_part_one
    map = AdventOfCode2021::HeightMap.new(DAY_NINE_INPUT)
    assert_equal 0, map.risk_level_sum
  end
end