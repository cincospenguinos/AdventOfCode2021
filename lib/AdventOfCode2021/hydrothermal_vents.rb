module AdventOfCode2021
  class HydrothermalGrid
    attr_reader :grid

    def initialize(size)
      @grid = []
      size.times { @grid << Array.new(size, 0) }
    end

    def add(segment)
      segment.points.each do |p|
        add_intersection_at(p)
      end
    end

    def overlapping_segments_at_or_above(amount)
      grid.flatten.select { |a| a >= amount }.size
    end

    def to_s
      str = grid.map do |line|
        line.map { |num| num == 0 ? '.' : num.to_s }.join('')
      end
      str.join("\n")
    end

    private

    def add_intersection_at(p)
      @grid[p.y][p.x] += 1
    end
  end

  class HydrothermalSegment
    attr_reader :start, :finish

    def initialize(point_a, point_b)
      if point_a.x < point_b.x
        @start = point_a
        @finish = point_b
      else
        @start = point_b
        @finish = point_a
      end
    end

    def points
      if horizontal?
        range_x.map { |x| OpenStruct.new(x: x, y: start.y) }
      elsif vertical?
        range_y.map { |y| OpenStruct.new(x: start.x, y: y) }
      else
        range_x.each_with_index.map do |x, idx|
          y = idx * slope
          OpenStruct.new(x: x, y: y)
        end
      end
    end

    def diagonal?
      !horizontal? && !vertical?
    end

    def to_s
      "#{start.x},#{start.y} -> #{finish.x},#{finish.y}"
    end

    private

    def horizontal?
      start.y == finish.y
    end

    def vertical?
      start.x == finish.x
    end

    def range_x
      start.x..finish.x
    end

    def range_y
      return finish.y..start.y if start.y > finish.y
      start.y..finish.y
    end

    def slope
      return 0 if horizontal? || vertical?
      return 1 if start.y > finish.y
      -1
    end
  end

  class HydrothermalVents
    attr_reader :grid, :segments

    def initialize(input)
      @grid = HydrothermalGrid.new(maximum_dimension(input))
      @segments = input.each_line.map do |segment_data|
        points = segment_data.gsub(/\s+/, '')
          .split('->')
          .map { |p| p.split(',').map(&:to_i) }
          .map { |p| point(p[0], p[1]) }
        HydrothermalSegment.new(points[0], points[1])
      end
    end

    def overlapping_segments(amount, diagonals = false)
      diagonals ? to_add = segments : to_add = segments.reject(&:diagonal?)
      to_add.each { |p| grid.add(p) }
      grid.overlapping_segments_at_or_above(amount)
    end

    private

    def maximum_dimension(input = nil)
      @maximum_dimension ||= input.gsub('->', '')
        .split(/[,\s]+/)
        .reject { |s| s.empty? }
        .map(&:to_i)
        .max + 1
    end

    def point(x, y)
      OpenStruct.new(x: x, y: y)
    end
  end
end