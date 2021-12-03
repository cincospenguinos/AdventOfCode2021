module AdventOfCode2021
  class BitFrequencyQuery
    attr_reader :frequency_hash

    def initialize(frequency_hash)
      @frequency_hash = frequency_hash
    end

    def most_frequent
      return '0' if frequency_hash['0'] > frequency_hash['1']
      '1'
    end

    def least_frequent
      return '1' if frequency_hash['0'] > frequency_hash['1']
      '0'
    end
  end

  class SubmarineDiagnostic
    attr_reader :bytes_str

    def initialize(report)
      @bytes_str = report.split("\n")
      @gamma = nil
      @epsilon = nil
      @oxygen_generator = nil
      @co2_scrubber = nil
    end

    def gamma
      calculate_power if @gamma.nil?
      @gamma.to_i(2)
    end

    def epsilon
      calculate_power if @epsilon.nil?
      @epsilon.to_i(2)
    end

    def power_consumption
      gamma * epsilon
    end

    private

    def calculate_power
      @gamma = ''
      @epsilon = ''

      (0...bytes_str[0].length).each do |index|
        bit_query = BitFrequencyQuery.new(frequency_hash_for(index))
        @gamma += bit_query.most_frequent
        @epsilon += bit_query.least_frequent
      end
    end

    def frequency_hash_for(index)
      bytes_str.map { |e| e[index] }
        .group_by(&:itself)
        .transform_values(&:size)
    end
  end
end