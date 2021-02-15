# LS Solution

factorial = Enumerator.new do |yielder|
  accumulator = 1
  number = 0
  loop do
    accumulator = number.zero? ? 1 : accumulator * number
    yielder << accumulator
    number += 1
  end
end

# External iterators

6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
factorial.rewind
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="

# Internal iterators

puts "Internal"

factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end
puts "Enumerator map"

array = [1, 2, 3]
enum = array.to_enum :map
p enum.each {|n| n * 2}                        # [2, 4, 6]
p enum.with_index {|n, index| [index, n ** 2]} # [[0, 1], [1, 4], [2, 9], [3, 16]]

puts "****"

enum = 5.times
p enum.map { |e| e }      # [[], [], [], [], []]

enum = 1.upto 10
p enum.inject(:+)      # 55

enum = 5.downto 0
p enum.map {|n| n * 2} # [10, 8, 6, 4, 2, 0]

puts "((((("

enum = Enumerator.new do |yielder|
  n = 0
  loop do
    yielder << n
    n += 1
  end
end

p enum.first 10  # [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
