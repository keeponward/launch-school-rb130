class CustomSet

  attr_reader :arr
  def initialize(arr=[])
    @arr = arr
  end

  def empty?
    arr.empty?
  end

  def contains?(elem)
    arr.include? (elem)
  end

  def subset?(other)
    arr.all? { |e| other.arr.include? (e) }
  end

  def disjoint?(other)
    arr.none? { |e| other.arr.include? (e) }
  end

  def eql?(other)
    self.subset?(other) && other.subset?(self)
  end
  
  def add(num)
    @arr << num unless arr.include?(num)
    self
  end

  def ==(other)
    self.eql?(other)
  end

  def intersection(other)
    new_set = CustomSet.new
    arr.each do |e|
      new_set.add(e) if other.contains?(e)
    end
    new_set
  end

  def difference(other)
    new_set = CustomSet.new
    arr.each do |e|
      new_set.add(e) unless other.contains?(e)
    end
    new_set
  end

  def union(other)
    new_set = CustomSet.new
    self.arr.each do |e|
      new_set.add(e) if self.contains?(e) 
    end
    other.arr.each do |e|
      new_set.add(e) if other.contains?(e) 
    end
    new_set
  end

end

# set = CustomSet.new([1])
# puts set.subset?(CustomSet.new) == false

# set = CustomSet.new
# set.add(3)
# puts CustomSet.new([3]) == set

# set = CustomSet.new([1, 2, 4]).add(3)
# expected = CustomSet.new([1, 2, 4, 3])

# puts set
# puts expected
# puts expected == set

# set = CustomSet.new([3, 2, 5]).intersection(CustomSet.new)
# expected = CustomSet.new
# puts expected == set

# actual = CustomSet.new([1, 2, 3, 4]).difference(CustomSet.new)
# expected = CustomSet.new([1, 2, 3, 4])
# puts expected == actual

# puts "actual.arr"
# p actual.arr
# puts "expected.arr"
# p expected.arr

