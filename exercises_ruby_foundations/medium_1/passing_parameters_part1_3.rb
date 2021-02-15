# Passing Parameters Part 1

# Modify the method below so that the display/output of items is moved to a block, and its implementation is left up to the user of the gather method.

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  yield items.join(', ')
end

gather(items) do |str|
  puts "Let's start gathering food."
  puts str
  puts "Nice selection of food we have gathered!"
end

# LS Solution
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

# gather(items) { |produce| puts produce.join('; ') }

gather(items) do |produce|
  puts "We've gathered some vegetables: #{produce[1]} and #{produce[2]}"
end
