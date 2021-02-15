# Nil Assertions

# Write a minitest assertion that will fail if value is not nil.


# require 'simplecov'
# SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class NilAssertionTest < MiniTest::Test

  def setup
    @value = nil
  end

  # Your tests go here. Remember they must start with "test_"

  def test_nil
    assert_equal(nil, @value)
  end

end
