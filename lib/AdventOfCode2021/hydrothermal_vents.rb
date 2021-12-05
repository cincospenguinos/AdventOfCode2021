module AdventOfCode2021
  class HydrothermalGrid
    attr_reader :grid

    def initialize(size)
      @grid = []
      size.times { @grid << Array.new(size, 0) }
    end

    def add(segment)
      if segment.vertical?
        segment.range_x.each { |x| add_intersection_at(x, segment.start.y) }
      elsif segment.horizontal?
        segment.range_y.each { |y| add_intersection_at(segment.start.x, y) }
      else
        # TODO: What do?
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

    def add_intersection_at(x, y)
      @grid[x][y] += 1
    end
  end

  class HydrothermalSegment
    attr_reader :start, :finish

    def initialize(point_a, point_b)
      @start = point_a
      @finish = point_b
    end

    def horizontal?
      start.x == finish.x
    end

    def vertical?
      start.y == finish.y
    end

    def range_x
      return finish.x..start.x if start.x > finish.x
      start.x..finish.x
    end

    def range_y
      return finish.y..start.y if start.y > finish.y
      start.y..finish.y
    end
  end

  class HydrothermalVents
    attr_reader :grid, :points

    def initialize(input)
      @grid = HydrothermalGrid.new(maximum_dimension(input))
      @points = input.each_line.map do |segment_data|
        points = segment_data.gsub(/\s+/, '')
          .split('->')
          .map { |p| p.split(',').map(&:to_i) }
          .map { |p| point(p[0], p[1]) }
        HydrothermalSegment.new(points[0], points[1])
      end
    end

    def overlapping_segments(amount)
      points.each { |p| grid.add(p) }
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