VALUE = [ [1, %w(A E I O U L N R S T)],
[2, %w(D G)],
[3, %w(B C M P)],
[4, %w(F H V W Y)],
[5, %w(K)],
[8, %w(J X)],
[10, %w(Q Z)]]

class Scrabble

  attr_reader :str, :hash, :word_arr

  def initialize(str)
    @str = str
    @word_arr = str == nil ? [] : str.chars
    @hash = {}

    # p @word_arr

    VALUE.each do |val_chars_arr|
      val_chars_arr[1].each do |char|
        @hash[char] = val_chars_arr[0]
      end
    end

  end

  def score
    # puts " hash[word_arr[0].upcase] = #{hash[word_arr[0].upcase]}"
    word_arr.reduce(0) do |accum, chr|
      # puts "accum = #{accum}   chr.upcase = #{chr.upcase}  hash[chr.upcase] = #{hash[chr.upcase]}"
      accum + hash.fetch(chr.upcase, 0)
    end
  end

  def self.score(str)
    myScrabble = Scrabble.new(str)
    # 13
    myScrabble.score
  end

end

myScr = Scrabble.new('quirky')

puts myScr.score