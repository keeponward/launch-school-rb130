

# string = 
# "    A    \n"\
# "   B B   \n"\
# "  C   C  \n"\
# " D     D \n"\
# "E       E\n"\
# " D     D \n"\
# "  C   C  \n"\
# "   B B   \n"\
# "    A    \n"

class Diamond
  def self.make_diamond(letter)
    diamond_out_str = ''
    # puts "letter = #{letter}  letter.ord = #{letter.ord}"
    @@ord = letter.ord
    dim = (@@ord - 64) * 2 - 1
    @@mid = dim/2 + 1

    (1..dim).each do |row|
      (1..dim).each do |col|
        diamond_out_str << self.get_char(row, col)
      end
      diamond_out_str << "\n"
    end
    diamond_out_str
  end

  def self.get_char(row, column)
    row = self.reflect_around_midpoint(row)
    col = self.reflect_around_midpoint(column)
    
    if col == (@@mid-row) + 1
      (@@ord - @@mid + row).chr
    else
      ' '
    end
  end

  def self.reflect_around_midpoint(point)
    point > @@mid ? 2*@@mid - point : point
  end
end

puts Diamond.make_diamond('E')
# answer = Diamond.make_diamond('A')
# puts answer