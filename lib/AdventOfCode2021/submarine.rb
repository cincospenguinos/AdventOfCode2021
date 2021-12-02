module AdventOfCode2021
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

					e
				end
		end

		def horizontal
			@horizontal ||= course.select { |e| e[0] == :forward }.map { |e| e[1] }.sum
		end

		def vertical
			@vertical ||= course.select { |e| %i(up down).include?(e[0]) }.map { |e| e[1] }.sum
		end

		def with_aim
			@horizontal = 0
			@vertical = 0
			aim = 0

			course.each do |step|
				if step[0] == :forward
					@horizontal += step[1]
					@vertical += step[1] * aim
				else
					aim += step[1]
				end
			end

			@horizontal * @vertical
		end
	end
end