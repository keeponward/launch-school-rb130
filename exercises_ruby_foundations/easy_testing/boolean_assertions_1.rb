# require 'simplecov'
# SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

# require_relative 'boolean_assertions'

class BooleanAssertionTest < MiniTest::Test

  def setup
    @value = 3
  end

  # Your tests go here. Remember they must start with "test_"

  def test_value_odd
    assert_equal(true, @value.odd?)
  end

  def test_value_odd_LS
    value = 5
    assert value.odd?, 'value is not odd'
  end

end
