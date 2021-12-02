module AdventOfCode2021
	class SubmarineInstruction
		attr_reader :direction, :amount

		def initialize(direction, amount)
			@direction = direction
			@amount    = amount
		end

		def forward?
			direction == :forward
		end
	end

	class Submarine
		attr_reader :course

		def initialize(course)
			@course = course.split("\n")
				.map(&:strip)
				.map { |e| e.split(/\s+/) }
				.map do |e|
					e[0] = e[0].to_sym
					e[1] = e[1].to_i
					e[1] = -e[1] if e[0] == :up
					SubmarineInstruction.new(e[0], e[1])
				end
		end

		def horizontal
			@horizontal ||= course.select { |e| e.forward? }.map { |e| e.amount }.sum
		end

		def vertical
			@vertical ||= course.select { |e| %i(up down).include?(e.direction) }.map { |e| e.amount }.sum
		end

		def with_aim
			@horizontal = 0
			@vertical = 0
			aim = 0

			course.each do |step|
				if step.forward?
					@horizontal += step.amount
					@vertical += step.amount * aim
				else
					aim += step.amount
				end
			end

			@horizontal * @vertical
		end
	end
end