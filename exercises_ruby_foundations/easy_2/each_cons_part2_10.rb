# each_cons (Part 2)

# In the previous exercise, we wrote a method that emulates Enumerable#each_cons, but limited our method to handling 2 elements at a time. Enumerable#each_cons can actually handle any number of elements at a time: 1, 2, 3, or more.

# Update your each_cons method so it takes an argument that specifies how many elements should be processed at a time.

# Your method may use #each, #each_index, #each_with_object, #inject, loop, for, while, or until to iterate through the Array passed in as an argument, but must not use any other methods that iterate through an Array or any other collection.

def each_cons(arr, num_cons_elems)
  num_yields = arr.size - num_cons_elems + 1
  puts "arr.size = #{arr.size}   num_cons_elems = #{num_cons_elems}   num_yields = #{num_yields}"
  num_yields.times do |index|
    p *arr[index..(index + num_cons_elems - 1)]
    yield(*arr[index..(index + num_cons_elems - 1)])
    index += 1
  end
  nil
end

# LS Solution
def each_cons_LS(array, n)
  array.each_index do |index|
    break if index + n - 1 >= array.size
    yield(*array[index..(index + n - 1)])
  end
  nil
end


hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  # puts "value = #{value}"
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  # puts "value1 = #{value1}   value2 = #{value2}"
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  # puts "value1 = #{value1}   values = #{values}"
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}

# puts "*******"
# a1 = [1,2,3,4,5,6]

# puts a1[2..4]
# puts *a1[2..4]

# p a1[2..4]
# p *a1[2..4]