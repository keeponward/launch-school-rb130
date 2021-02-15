# Find Missing Numbers

# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.


def missing(arr)
  out_arr = []
  prev_elem = arr.first
  arr.each_with_index do |elem, i|
    next if i == 0
    (prev_elem + 1).upto(elem - 1) do |up_elem|
      out_arr << up_elem
      # puts "up_elem = #{up_elem} written to out_arr"
    end
    prev_elem = elem
  end
  out_arr
end

# LS Solution
def missingLS(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

# Further Exploration (?)

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# p missing([-3, -2, 1, 5])
# p missing([1, 2, 3, 4])
# p missing([1, 5])
# p missing([6])