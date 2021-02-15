# Equality Assertions

# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

# require 'simplecov'
# SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EqualityAssertionTest < MiniTest::Test

  def setup
    @value = 'XyZ'
  end

  # Your tests go here. Remember they must start with "test_"

  def test_value_downcase
    assert_equal('xyz', @value.downcase)
  end

end
