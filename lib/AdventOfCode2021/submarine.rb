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

		def without_aim
			calculate do |step|
				if step.forward?
					@horizontal += step.amount
				else
					@vertical += step.amount
				end
			end
		end

		def with_aim
			calculate do |step|
				if step.forward?
					@horizontal += step.amount
					@vertical += step.amount * @aim
				else
					@aim += step.amount
				end
			end
		end

		private

		def calculate
			@horizontal = 0
			@vertical   = 0
			@aim = 0

			course.each do |step|
				yield step
			end

			@horizontal * @vertical
		end
	end
end