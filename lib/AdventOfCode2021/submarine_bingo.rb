require 'ostruct'

module AdventOfCode2021
  class BingoBoard
    BOARD_SIZE = 5

    attr_reader :board

    def initialize(board_lines)
      @board = board_lines.join(' ')
        .split(/\s+/)
        .reject { |s| s.empty? }
        .map(&:to_i)
      @drawn_numbers = []
      @solved = false
    end

    def draw(number)
      if (idx = board.index(number))
        xy = to_xy(idx, number)
        @drawn_numbers << xy
      end

      solved?
    end

    def solved?
      return true if @solved
      @solved ||= (0...BOARD_SIZE).map { |num|
        row_size = drawn_row_at(num).size
        col_size = drawn_col_at(num).size
        row_size == BOARD_SIZE || col_size == BOARD_SIZE
      }.include?(true)
    end

    def score
      marked_numbers = @drawn_numbers.map(&:value)
      board.reject { |i| marked_numbers.include?(i) }.sum
    end

    private

    def drawn_row_at(num)
      @drawn_numbers.select { |p| p.y == num }
    end

    def drawn_col_at(num)
      @drawn_numbers.select { |p| p.x == num }
    end

    def to_xy(index, value)
      OpenStruct.new(x: index % BOARD_SIZE, y: index / BOARD_SIZE, value: value)
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
    attr_reader :boards, :number_sequence

    def initialize(input)
      extraction = BingoInputExtraction.new(input)
      @boards = extraction.boards
      @number_sequence = extraction.number_sequence
    end

    def first_winning_score
      enumerate_winners do |winners, number|
        return winners.first.score * number
      end
    end

    def last_winning_score
      enumerate_winners do |winners, number|
        # TODO: This
      end
    end

    private

    def enumerate_winners
      number_sequence.each do |number|
        step = boards.each_with_index.map { |b, idx| OpenStruct.new(won: b.draw(number), index: idx) }

        if step.map(&:won).include?(true)
          winners = step.select { |b| b.won }
            .map(&:index)
            .map { |i| boards[i] }
          yield winners, number
        end
      end
    end
  end
end