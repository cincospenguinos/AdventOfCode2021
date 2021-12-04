module AdventOfCode2021
  class BingoBoard
    def initialize(board_lines)
    end
  end

  class BingoInputExtraction
    attr_reader :number_sequence, :boards

    def initialize(input)
      lines = input.split("\n").reject { |str| str.empty? }
      @number_sequence = lines[0].split(',').map(&:to_i)
      @boards = lines[1...lines.length].each_slice(5).map { |b| BingoBoard.new(b) }
    end
  end

  class SubmarineBingo
    def initialize(input)
    end

    def winning_score
    end
  end
end