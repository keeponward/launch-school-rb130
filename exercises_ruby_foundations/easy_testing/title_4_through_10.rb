# Titles 4-10

require 'set'

class NoExperienceError < StandardError; end


# require 'simplecov'
# SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Employee
  def hire
    raise NoExperienceError
  end
end

class List
  def process
    self
  end
end

class Titles410Test < MiniTest::Test

  def setup
    # Title 4
    @array4 = []

    # Title 5
    @array5 = ['xyz']

    # Title 6
    @employee = Employee.new

    # Title 7
    @value7 = Numeric.new


    # Title 9: Same Object Assertions
    @list = List.new

    # Title 10
    @array10 = ['not_xyz']


  end
 
  # Title 4: Empty Object Assertions
  # Write a minitest assertion that will fail if the Array list is not empty.
  def test_array_empty_4
    assert_equal(true, @array4.empty?)
    assert_empty(@array4)
  end

  # Title 5: Included Object Assertions
  # Write a minitest assertion that will fail if the 'xyz' is not in the Array list.
  def test_array_5
    assert_equal(true, @array5.include?('xyz'))
  end

  # Title 6: Exception Assertions
  # Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.
  def test_exceptions
    assert_raises(NoExperienceError) { @employee.hire }
  end

  # Title 7: Type Assertions
  # Write a minitest assertion that will fail if value is not an instance of the Numeric class exactly.
  # Value may not be an instance of one of Numeric's superclasses.
  def test_type
    value = Numeric.new
    assert_equal(true, value.instance_of?(Numeric))

    # LS Solution
    assert_instance_of Numeric, value
  end


  # Title 8: Kind Assertions

  # Write a minitest assertion that will fail if the class of value is not Numeric or one of Numeric's subclasses (e.g., Integer, Float, etc).
  def test_kind
    value = 99
    assert_equal(true, value.kind_of?(Numeric))

    # LS Solution
    assert_kind_of Numeric, value
  end


  # Title 9: Same Object Assertions
  # Write a test that will fail if list and the return value of list.process are different objects.
  def test_same_object
    assert_same(@list, @list.process)

    # LS Solution
    # assert_kind_of Numeric, value
  end
 
  # Title 10: Refutations
  # Write a test that will fail if 'xyz' is one of the elements in the Array list:
  def test_refute_include
    refute_includes(@array10, 'xyz')

    # LS Solution
    # assert_kind_of Numeric, value
  end
end
