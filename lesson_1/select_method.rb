def select(array)
  select_arr = []
  index = 0
  while index < array.size
    select_arr << array[index] if yield(array[index])
    index += 1
  end
  select_arr
end


array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true


p select(array) { |num| num.odd? } == [1, 3, 5]
p select(array) { |num| puts num } == [] # because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 } == [1, 2, 3, 4, 5] # because "num + 1" evaluates to true




