require 'test_helper'

class SubmarineDepthsTest < Minitest::Test
	EXAMPLE_DEPTHS = <<~DEPTHS
		199
		200
		208
		210
		200
		207
		240
		269
		260
		263
	DEPTHS

	def test_has_correct_number_of_increases
		depths = AdventOfCode2021::SubmarineDepths.new(EXAMPLE_DEPTHS)
		assert_equal 7, depths.increases
	end

	def test_answers_part_one
		day_one = File.open('test/test_data/day_one.txt', 'r', &:read)
		depths = AdventOfCode2021::SubmarineDepths.new(day_one)
		assert_equal 1228, depths.increases
	end
end