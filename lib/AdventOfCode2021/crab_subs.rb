module AdventOfCode2021
  class CrabSubs
    attr_reader :subs

    def initialize(input)
      @subs = input.split(',').map(&:to_i).sort
    end

    def naive_min_fuel_cost
      subs.map { |s| naive_cost(s) }.min
    end

    def min_fuel_cost
      subs.map { |s| precise_cost(s) }.min
    end

    private

    def naive_cost(index)
      subs.map { |s| (s - index).abs }.sum
    end

    def precise_cost(index)
      costs = subs.map do |s|
        diff = (s - index).abs
        (diff ** 2 + diff) / 2
      end
      costs.sum
    end
  end
end