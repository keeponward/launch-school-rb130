class Triangle
  attr_reader :arr_sides

  def initialize(a, b, c)
    @arr_sides = []
    @arr_sides[0] = a
    @arr_sides[1] = b
    @arr_sides[2] = c

    raise ArgumentError, "not a triangle (at least one side <= 0)" if arr_sides.any? { |s| s <= 0 } 

    raise ArgumentError, "not a triangle (at least one side is greater that the sum of the other two" if a > b + c || b > a + c || c > a + b

  end

  def kind
  
    arr_uniq = arr_sides.uniq

    return case arr_uniq.size
    when 1
      'equilateral'
    when 2
      'isosceles'
    when 3
      'scalene'
    end
  end
end


# myTri = Triangle.new(4, 4, 4)
# puts myTri.kind




