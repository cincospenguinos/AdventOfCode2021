module AdventOfCode2021
	class SubmarineDepths
		def initialize(depth_string)
			@depths = depth_string.split(/\s+/).map(&:to_i)
			@dual_increases = nil
			@sum_increases = nil
			@sum_array = nil
		end

		def dual_increases
			return @dual_increases unless @dual_increases.nil?

			@dual_increases = increases_for(@depths)
			@dual_increases
		end

		def sum_increases
			return @sum_increases unless @sum_increases.nil?

			@sum_increases = increases_for(sums)
			@sum_increases
		end

		private

		def sums
			return @sum_array unless @sum_array.nil?
			@sum_array = []
			(2...(@depths.size)).each { |index| @sum_array << @depths[(index - 2)..index].sum }
			@sum_array
		end

		def increases_for(array)
			increases = 0
			(1...(array.size)).each do |index|
				increases += 1 if array[index - 1] < array[index]
			end

			increases
		end
	end
end