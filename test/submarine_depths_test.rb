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

	DAY_ONE_INPUT = File.open('test/test_data/day_one.txt', 'r', &:read)

	def test_has_correct_number_of_increases
		depths = AdventOfCode2021::SubmarineDepths.new(EXAMPLE_DEPTHS)
		assert_equal 7, depths.dual_increases
	end

	def test_answers_part_one
		depths = AdventOfCode2021::SubmarineDepths.new(DAY_ONE_INPUT)
		assert_equal 1228, depths.dual_increases
	end

	def test_has_correct_number_of_sum_increases
		depths = AdventOfCode2021::SubmarineDepths.new(EXAMPLE_DEPTHS)
		assert_equal 5, depths.sum_increases
	end

	def test_answers_part_two
		depths = AdventOfCode2021::SubmarineDepths.new(DAY_ONE_INPUT)
		assert_equal 1257, depths.sum_increases
	end
end