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

  def test_diagnostic_calculates_gamma
    diagnostic = AdventOfCode2021::SubmarineDiagnostic.new(EXAMPLE_INPUT)
    assert_equal 22, diagnostic.gamma
  end
end