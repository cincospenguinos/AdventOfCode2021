require 'test_helper'

class LanternfishTest < Minitest::Test
  EXAMPLE_INPUT = '3,4,3,1,2'
  DAY_SIX_INPUT = File.open('test/test_data/day_six.txt', 'r', &:read)

  def test_example_works
    fish = AdventOfCode2021::LanternfishModel.new(EXAMPLE_INPUT)
    assert_equal 26, fish.after(18)
    assert_equal 5215, fish.after(80)
  end

  def test_part_one_works
    fish = AdventOfCode2021::LanternfishModel.new(DAY_SIX_INPUT)
    assert_equal 386536, fish.after(80)
  end

  def test_part_two_works
    skip 'too slow'
    fish = AdventOfCode2021::LanternfishModel.new(DAY_SIX_INPUT)
    assert_equal 0, fish.after(256)
  end
end