class Octal
  def initialize(str)
    @str = str
  end

  def to_decimal
    return 0 if !valid_octal_string(@str)
  
    power = 0
    sum = 0
    @str.reverse.chars.each do |c|
      sum += c.to_i * 8.pow(power)
      power += 1
    end
    sum

  end

  private

  def valid_octal_string(str)
    # str.count("^0-7").zero?
    !(str =~ /\D|[8]|[9]/)
  end
end

# p 12345.digits(7)   #=> [4, 6, 6, 0, 5]
# p 89.digits(3)   #=> [2 2 0 0 1]

# my_octal = Octal.new('12')
# puts my_octal.to_decimal

# s1 = '9876ae'

# puts s1.count("^0-7")


# s2 = 'abc'

# regexp = Regexp.new(/a+/)

# puts s2 =~ regexp
# puts s2 =~ /[a+]/
