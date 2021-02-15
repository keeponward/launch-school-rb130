# Group 1
puts "Group 1" # Added
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Group 2
puts "Group 2" # Added
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call('dummy_param') # Added
# my_lambda.call # Deleted
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# Group 3
puts "Group 3" # Added
def block_method_1(animal)
  yield if block_given? # Added
  # yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

# Group 4
puts "Group 4" # Added
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { |animal| puts "This is a #{animal}."} # Added
# block_method_2('turtle') { puts "This is a #{animal}."}

=begin
1) A proc that expects a block parameter can be called with or without a parameter.
   If it's called without a parameter it takes on the value, nil.

2) A lambda.class is a Proc

3) If lambda expects 1 block parameter then 1 must be sent.  A wrong number of arguments (given 0, expected 1) (ArgumentError) will occur if not.

4) No Lambda.new (can't instantiate a Lambda)

5) A method can yield to implicit block only if a block was passed to it. (use block_given?)

6) Blocks are forgiving.  If 2 block params are specified and only 1 received the 2nd one will be nil



=end



   