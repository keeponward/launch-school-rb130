def reduce(arr, def_accum = nil)
  if def_accum == nil
    accum = arr[0]
    index = 1
  else
    accum = def_accum
    index = 0
  end
  while index < arr.size
    accum = yield(accum, arr[index])
    index += 1
  end
  accum
end
  
  
array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

# arr1 = [1, 2]

# arr1 = arr1 + ['a', 'b']

# p arr1

# Extra challenge
puts "Extra challenge"

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']