class RomanNumeral

  attr_accessor :dec_num

  def initialize(dec_num)
    @dec_num = dec_num
  end

  def to_roman

    out_str = ''
  
    # puts "dec_num = #{dec_num}"

    dec_arr = dec_num.to_s.chars
    # p dec_arr
    num_1s = dec_arr.pop.to_i
    num_10s = dec_arr.pop.to_i
    num_100s = dec_arr.pop.to_i
    num_1000s = dec_arr.pop.to_i

    # num_1000s, mod = dec_num.divmod(1000)
    # num_100s, mod = mod.divmod(100)
    # num_10s, mod = mod.divmod(10)
    # num_1s = mod
  
    out_str += gen_roman(num_1000s, 'M')
    out_str += gen_roman(num_100s, 'C', 'D', 'M')
    out_str += gen_roman(num_10s, 'X', 'L', 'C')
    out_str += gen_roman(num_1s, 'I', 'V', 'X')

    return out_str
  
  end
  
  private

  def gen_roman(num, chr_root, chr_5x=nil, chr_10x=nil)
    return (chr_root * num) if (chr_5x == nil || num < 4)
    return chr_root + chr_5x if num == 4
    return chr_5x if num == 5
    return chr_5x + (chr_root * (num - 5)) if num < 9
    return chr_root + chr_10x
    # return chr_root + chr_10x if num == 9
  end  
end

# puts RomanNumeral.new(1776).to_roman == 'MDCCLXXVI'
# puts RomanNumeral.new(100).to_roman == 'C'

