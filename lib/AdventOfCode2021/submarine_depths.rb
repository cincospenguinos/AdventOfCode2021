module AdventOfCode2021
	class SubmarineDepths
		def initialize(depth_string)
			@depths = depth_string.split(/\s+/).map(&:to_i)
			@increases = nil
		end

		def increases
			return @increases unless @increases.nil?

			@increases = 0
			(1...(@depths.size)).each do |index|
				@increases += 1 if @depths[index - 1] < @depths[index]
			end

			@increases
		end
	end
end