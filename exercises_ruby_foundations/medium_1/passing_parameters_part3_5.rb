# Passing Parameters Part 3

# Given this code:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce the corresponding output shown in numbers 1-4 listed below:


puts "1)"
gather(items) do |*arr_all_but_last, last|
  puts arr_all_but_last.join(', ')
  puts last
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!


puts "2)"
gather(items) do | first, *arr_all_but_first_and_last, last|
  puts first
  puts arr_all_but_first_and_last.join(', ')
  puts last
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!


puts "3)"
gather(items) do | first, *arr_all_but_first|
  puts first
  puts arr_all_but_first.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!


puts "4)"

gather(items) do | item1, item2, item3, item4|
  puts "#{item1}, #{item2}, #{item3}, #{item4}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!