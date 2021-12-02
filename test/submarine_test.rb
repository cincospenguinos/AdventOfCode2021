require 'test_helper'

class SubmarineDepthsTest < Minitest::Test
	EXAMPLE_DIRECTIONS = <<~DIR
		forward 5
		down 5
		forward 8
		up 3
		down 8
		forward 2
	DIR

	DAY_TWO_INPUT = File.open('test/test_data/day_two.txt', 'r', &:read)

	def test_directions_work
		submarine = AdventOfCode2021::Submarine.new(EXAMPLE_DIRECTIONS)
		assert_equal 15, submarine.horizontal
		assert_equal 10, submarine.vertical
		assert_equal 150, submarine.horizontal * submarine.vertical
	end

	def test_day_two_part_one_works
		submarine = AdventOfCode2021::Submarine.new(DAY_TWO_INPUT)
		assert_equal 1692075, submarine.vertical * submarine.horizontal
	end

	def test_with_aim
		submarine = AdventOfCode2021::Submarine.new(EXAMPLE_DIRECTIONS)
		assert_equal 900, submarine.with_aim
	end

	def test_day_two_part_two_works
		submarine = AdventOfCode2021::Submarine.new(DAY_TWO_INPUT)
		assert_equal 1749524700, submarine.with_aim
	end
end