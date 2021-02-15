class Series

  attr_reader :arr_ints

  def initialize(digit_str)
    @digit_str = digit_str
    # @arr_ints = digit_str.split('').map(&:to_i)
    @arr_ints = digit_str.each_char.map(&:to_i)
  end

  def slices(length)
    raise ArgumentError, "Expected slice size greater than input string length" if length > arr_ints.size
    out_arr = []
    (0..arr_ints.size - length).each do |anchor_idx|
      out_arr << arr_ints.slice(anchor_idx, length)
    end
    out_arr
  end
end

# LS Solution
class SeriesLS
  attr_reader :numbers

  def initialize(string)
    @numbers = string.each_char.map(&:to_i)
  end

  def slices(count)
    fail ArgumentError.new("Slice is longer than input.") if count > numbers.length
    no_to_a = numbers.each_cons(count)
    numbers.each_cons(count).to_a
  end
end


# my_series = Series.new('01234')
# p my_series.slices(1) == [[0], [1], [2], [3], [4]]

# series = Series.new('01234')
# p series.slices(2) == [[0, 1], [1, 2], [2, 3], [3, 4]]

# series = Series.new('98273463')
# expected = [[9, 8], [8, 2], [2, 7], [7, 3], [3, 4], [4, 6], [6, 3]]
# p series.slices(2) == expected


# series = Series.new('01234')
# exp1 = [[0, 1, 2], [1, 2, 3], [2, 3, 4]]
# p series.slices(3) == exp1

