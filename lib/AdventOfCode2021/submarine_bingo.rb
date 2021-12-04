require 'ostruct'

module AdventOfCode2021
  class BingoBoard
    BOARD_SIZE = 5

    def initialize(board_lines)
      @board = board_lines.join(' ').split(/\s+/).map(&:to_i)
      @drawn_numbers = []
      @solved = false
    end

    def draw(number)
      if (idx = @board.index(number))
        xy = to_xy(idx)
        @drawn_numbers << xy
      end

      solved?
    end

    def solved?
      return true if @solved
      @solved ||= (0...BOARD_SIZE).map { |num|
        row_size = @drawn_numbers.select { |p| p.y == num }.size
        col_size = @drawn_numbers.select { |p| p.x == num }.size
        row_size == BOARD_SIZE || col_size == BOARD_SIZE
      }.include?(true)
    end

    private

    def to_xy(index)
      OpenStruct.new(x: index % BOARD_SIZE, y: index / BOARD_SIZE)
    end

    def to_index(xy)
      y * BOARD_SIZE + x
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