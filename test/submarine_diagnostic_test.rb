require 'test_helper'

class SubmarineDiagnosticTest < Minitest::Test
  EXAMPLE_INPUT = <<~POWER
    00100
    11110
    10110
    10111
    10101
    01111
    00111
    11100
    10000
    11001
    00010
    01010
  POWER

  DAY_THREE_INPUT = File.open('test/test_data/day_three.txt', 'r', &:read)

  def test_diagnostic_calculates_gamma
    diagnostic = AdventOfCode2021::SubmarineDiagnostic.new(EXAMPLE_INPUT)
    assert_equal 22, diagnostic.gamma
  end

  def test_diagnostic_calculates_epsilon
    diagnostic = AdventOfCode2021::SubmarineDiagnostic.new(EXAMPLE_INPUT)
    assert_equal 9, diagnostic.epsilon
  end

  def test_diagnostic_calculates_power_consumption
    diagnostic = AdventOfCode2021::SubmarineDiagnostic.new(EXAMPLE_INPUT)
    assert_equal 198, diagnostic.power_consumption
  end

  def test_diagnostic_calculates_first_part
    diagnostic = AdventOfCode2021::SubmarineDiagnostic.new(DAY_THREE_INPUT)
    assert_equal 3847100, diagnostic.power_consumption
  end

  def test_diagnostic_oxygen_generator
    diagnostic = AdventOfCode2021::SubmarineDiagnostic.new(EXAMPLE_INPUT)
    assert_equal 23, diagnostic.oxygen_generator
  end

  def test_diagnostic_co2_scrubber
    diagnostic = AdventOfCode2021::SubmarineDiagnostic.new(EXAMPLE_INPUT)
    assert_equal 10, diagnostic.co2_scrubber
  end

  def test_life_support_example
    diagnostic = AdventOfCode2021::SubmarineDiagnostic.new(EXAMPLE_INPUT)
    assert_equal 230, diagnostic.life_support
  end

  def test_answers_part_two
    diagnostic = AdventOfCode2021::SubmarineDiagnostic.new(DAY_THREE_INPUT)
    assert_equal 4105235, diagnostic.life_support
  end
end