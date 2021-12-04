require 'test_helper'

class SubmarineBingoTest < Minitest::Test
  EXAMPLE_INPUT = <<~BINGO
  7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

  22 13 17 11  0
   8  2 23  4 24
  21  9 14 16  7
   6 10  3 18  5
   1 12 20 15 19

   3 15  0  2 22
   9 18 13 17  5
  19  8  7 25 23
  20 11 10 24  4
  14 21 16 12  6

  14 21 17 24  4
  10 16 15  9 19
  18  8 23 26 20
  22 11 13  6  5
   2  0 12  3  7
  BINGO

  DAY_FOUR_INPUT = File.open('test/test_data/day_four.txt', 'r', &:read)

  def test_bingo_input_extraction
    input = AdventOfCode2021::BingoInputExtraction.new(EXAMPLE_INPUT)
    assert_equal [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1], input.number_sequence
    assert_equal 3, input.boards.size
  end

  def test_bingo_board_wins_horizontally
    input = AdventOfCode2021::BingoInputExtraction.new(EXAMPLE_INPUT)
    board = input.boards.first

    refute board.draw(0)
    refute board.draw(11)
    refute board.draw(17)
    refute board.draw(13)
    assert board.draw(22)
  end

  def test_bingo_board_wins_vertically
    input = AdventOfCode2021::BingoInputExtraction.new(EXAMPLE_INPUT)
    board = input.boards.first

    refute board.draw(11)
    refute board.draw(4)
    refute board.draw(16)
    refute board.draw(18)
    assert board.draw(15)
  end

  def test_bingo_board_gives_correct_score
    input = AdventOfCode2021::BingoInputExtraction.new(EXAMPLE_INPUT)
    board = input.boards.last
    [7,4,9,5,11,17,23,2,0,14,21,24].each { |num| board.draw(num) }

    assert board.solved?
    assert_equal 188, board.score
  end

  def test_answers_first_part_correctly
    skip 'Getting the other things worked out'
    bingo = AdventOfCode2021::SubmarineBingo.new(EXAMPLE_INPUT)
    assert_equal 4512, bingo.winning_score
  end
end