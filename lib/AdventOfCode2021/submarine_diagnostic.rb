module AdventOfCode2021
  class SubmarineDiagnostic
    attr_reader :bytes_str

    def initialize(report)
      @bytes_str = report.split("\n")
    end

    def gamma
      length = bytes_str[0].length

      gamma = ''
      epsilon = ''

      (0...length).each do |index|
        frequency_hash = bytes_str.map { |e| e[index] }
          .group_by(&:itself)
          .transform_values(&:size)

        if frequency_hash['0'] > frequency_hash['1']
          gamma += '0'
          epsilon += '1'
        else
          gamma += '1'
          epsilon += '0'
        end
      end

      gamma.to_i(2)
    end
  end
end