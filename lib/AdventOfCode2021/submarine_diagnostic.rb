module AdventOfCode2021
  class SubmarineDiagnostic
    attr_reader :bytes_str

    def initialize(report)
      @bytes_str = report.split("\n")
      @gamma = nil
      @epsilon = nil
    end

    def gamma
      calculate if @gamma.nil?
      @gamma.to_i(2)
    end

    def epsilon
      calculate if @epsilon.nil?
      @epsilon.to_i(2)
    end

    private

    def calculate
      @gamma = ''
      @epsilon = ''
      length = bytes_str[0].length

      (0...length).each do |index|
        frequency_hash = bytes_str.map { |e| e[index] }
          .group_by(&:itself)
          .transform_values(&:size)

        if frequency_hash['0'] > frequency_hash['1']
          @gamma += '0'
          @epsilon += '1'
        else
          @gamma += '1'
          @epsilon += '0'
        end
      end
    end
  end
end