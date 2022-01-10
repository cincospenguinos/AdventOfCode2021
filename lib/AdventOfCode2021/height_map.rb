module AdventOfCode2021
  class HeightMap
    attr_reader :width, :height
    RISK_MODIFIER = 1

    def initialize(input)
      @map = []
      input.each_line.map { |l| @map << l.chomp.split('').map(&:to_i) }
      @width = @map.first.size
      @height = @map.size
    end

    def risk_levels
      @risk_levels ||= calculate_risk_levels
    end

    def risk_level_sum
      risk_levels.map { |i| i + RISK_MODIFIER }.sum
    end

    private

    def calculate_risk_levels
      levels = []

      (0...height).each do |y|
        (0...width).each do |x|
          val = level_at(x, y)
          add_level = values_around(x, y)
            .map { |v| val < v }
            .all?(true)
          levels << val if add_level
        end
      end

      levels
    end

    def values_around(x, y)
      vals = []

      (-1..1).each do |x_mod|
        (-1..1).each do |y_mod|
          next if x_mod == 0 && y_mod == 0
          vals << level_at(x + x_mod, y + y_mod)
        end
      end

      vals.reject { |v| v.nil? }
    end

    def level_at(x, y)
      return nil unless valid_point?(x, y)
      @map[y][x]
    end

    def valid_point?(x, y)
      return false if x < 0 || y < 0
      return false if y >= height
      return false if x >= width
      true
    end
  end
end