module AdventOfCode2021
  class BitFrequencyQuery
    attr_reader :frequency_hash

    def initialize(frequency_hash)
      @frequency_hash = frequency_hash
    end

    def most_freq
      return '0' if frequency_hash['0'] > frequency_hash['1']
      '1'
    end

    def least_frequent
      return '1' if frequency_hash['0'] > frequency_hash['1']
      '0'
    end

    def same_freq?
      frequency_hash['0'] == frequency_hash['1']
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

    def oxygen_generator
      @oxygen_generator ||= calculate_life_support_attr do |bit_query, e|
        if bit_query.same_freq?
          e == '1'
        else
          e == bit_query.most_freq
        end
      end
    end

    def co2_scrubber
      @co2_scrubber ||= calculate_life_support_attr do |bit_query, e|
        if bit_query.same_freq?
          e == '0'
        else
          e == bit_query.least_frequent
        end
      end
    end

    def life_support
      oxygen_generator * co2_scrubber
    end

    private

    def calculate_life_support_attr
      bytes = bytes_str.clone

      (0...byte_string_length).each do |idx|
        bit_query = BitFrequencyQuery.new(frequency_hash_at(idx, bytes))
        bytes = bytes.select { |e| yield bit_query, e[idx] }
        break if bytes.size == 1
      end

      bytes.first.to_i(2)
    end

    def byte_string_length
      bytes_str.first.length
    end

    def calculate_power
      @gamma = ''
      @epsilon = ''

      (0...byte_string_length).each do |idx|
        bit_query = BitFrequencyQuery.new(frequency_hash_at(idx))
        @gamma += bit_query.most_freq
        @epsilon += bit_query.least_frequent
      end
    end

    def frequency_hash_at(idx, array = bytes_str)
      array.map { |e| e[idx] }
        .group_by(&:itself)
        .transform_values(&:size)
    end
  end
end