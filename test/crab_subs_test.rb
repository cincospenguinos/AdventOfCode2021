require 'test_helper'

class CrabSubsTest < Minitest::Test
  EXAMPLE_INPUT = '16,1,2,0,4,2,7,1,2,14'
  DAY_SEVEN_INPUT = File.open('test/test_data/day_seven.txt', 'r', &:read)

  def test_example_part_one_works
    subs = AdventOfCode2021::CrabSubs.new(EXAMPLE_INPUT)
    assert_equal 37, subs.naive_min_fuel_cost
  end

  def test_part_one_works
    subs = AdventOfCode2021::CrabSubs.new(DAY_SEVEN_INPUT)
    assert_equal 359648, subs.naive_min_fuel_cost
  end

  def test_part_two_example_works
    subs = AdventOfCode2021::CrabSubs.new(EXAMPLE_INPUT)
    assert_equal 170, subs.min_fuel_cost
  end

  def test_part_two_works
    subs = AdventOfCode2021::CrabSubs.new(DAY_SEVEN_INPUT)
    assert_equal 100727924, subs.min_fuel_cost
  end
end