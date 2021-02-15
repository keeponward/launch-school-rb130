# Optional Blocks

# Write a method that takes an optional block. If the block is specified, the method should execute it, and return the value returned by the block. If no block is specified, the method should simply return the String 'Does not compute.'.

# Examples:

def compute
  block_given? ? yield : 'Does not compute.'

  # if block_given?
  #   yield
  # else
  #   'Does not compute.'
  # end
end

# LS Solution
def compute
  return 'Does not compute.' unless block_given?
  yield
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further Exploration


puts "Further Exploration"

def computeFE(param)
  return 'No block given.' unless block_given?
  yield(param)
end

p computeFE(9) { |p| p + 3 } == 12
p computeFE(3) { |p| 'a' * p } == 'aaa'
p computeFE(2) == 'No block given.'



