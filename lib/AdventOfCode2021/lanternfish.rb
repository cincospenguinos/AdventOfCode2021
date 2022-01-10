module AdventOfCode2021
  class Lanternfish
    SPAWN_DAYS_FOR_OFFSPRING = 8

    def initialize(days_until_spawn)
      @days_left = days_until_spawn
    end

    def day_elapsed
      @days_left -= 1
      return [] unless @days_left == -1

      @days_left = 6
      [Lanternfish.new(SPAWN_DAYS_FOR_OFFSPRING)]
    end
  end

  class LanternfishModel
    def initialize(input)
      @immutable_fish = input.split(',')
        .map(&:to_i)
        .map { |val| Lanternfish.new(val) }
        .freeze
    end

    def after(days)
      fish = initial_fish
      days.times  { fish += process(fish) }
      fish.size
    end

    private

    def process(fish)
      fish.map(&:day_elapsed).flatten
    end

    def initial_fish
      @immutable_fish.clone
    end
  end
end