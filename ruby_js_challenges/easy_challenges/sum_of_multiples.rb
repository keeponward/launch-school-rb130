class SumOfMultiples

  attr_reader :mult_arr

  def self.to(upper_bound)
    mult_arr = [3, 5]
    self.process(mult_arr, upper_bound)
  end

  def initialize(*multiples)
    @mult_arr = multiples.map { |m| m }
  end

  def to(upper_bound)
    process(@mult_arr, upper_bound)
  end

  # private
  
  def process(mult_arr, upper_bound)

    all_multiples = []
    # Each base multiple
    mult_arr.each do |mult|
      iter_mult = mult
      while iter_mult < upper_bound
        all_multiples << iter_mult
        iter_mult += mult
      end
    end

    all_multiples.uniq.sum
  end

  def self.process(mult_arr, upper_bound)

    all_multiples = []
    # Each base multiple
    mult_arr.each do |mult|
      iter_mult = mult
      while iter_mult < upper_bound
        all_multiples << iter_mult
        iter_mult += mult
      end
    end

    all_multiples.uniq.sum
  end
end

# LS Solution
class SumOfMultiples
  attr_reader :multiples

  def self.to(num)
    SumOfMultiples.new().to(num)
  end

  def initialize(*multiples)
    @multiples = (multiples.size > 0) ? multiples : [3, 5];
  end

  def to(num)
    (1...num).select do |current_num|
      any_multiple?(current_num)
    end.sum
  end

  private

  def any_multiple?(num)
    multiples.any? do |multiple|
      (num % multiple).zero?
    end
  end
end

# Inspired by Solution #1
class SumOfMultiples

  attr_reader :mult_arr

  def self.to(upper_bound, mult_arr = [3, 5])

    all_multiples = []
    # Each base multiple
    mult_arr.each do |mult|
      iter_mult = mult
      while iter_mult < upper_bound
        all_multiples << iter_mult
        iter_mult += mult
      end
    end

    all_multiples.uniq.sum
  end

  def initialize(*multiples)
    @mult_arr = multiples.map { |m| m }
  end

  def to(upper_bound)
    self.class.to(upper_bound, @mult_arr)
  end

end


puts SumOfMultiples.new(4, 6).to(15)  # 30

# puts SumOfMultiples.to(10) # 23

# puts SumOfMultiples.process([3, 5], 10)


