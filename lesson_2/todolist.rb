# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

require 'set'

class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end


class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo_item)
    # puts "todo_item.class = #{todo_item.class}"
    raise TypeError, "Can only add Todo objects" unless todo_item.class == Todo
    # puts "Adding todo item"
    @todos << todo_item
  end

  def <<(todo_item)
    add(todo_item)
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    self.todos.clone
  end

  def done?
    todos.all? { |item| item.done? == true }
  end

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    todos.fetch(index)
    self.todos[index].done!
  end

  def mark_undone_at(index)
    todos.fetch(index)
    self.todos[index].undone!
  end

  def done!
    todos.each { |item| item.done! }
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    todos.fetch(index)
    self.todos.delete_at(index)
  end

  def each
    index = 0
  
    while index < todos.size
      yield(todos[index])
      index += 1
    end
    self
  end

  # Returns an array
  # def select
  #   out_select = []
  #   each { |todo| out_select << todo if yield(todo) }
  #   out_select
  # end

  # Returns a TodoList
  def select
    sel_list = TodoList.new(title)
    # sel_list = TodoList.new("Selected (done) Todos")
    each { |todo| sel_list << todo if yield(todo) }
    sel_list
  end

  # rest of class needs implementation
  # @array.fetch(index)
#   raise BadTokenError, "Invalid token: #{token}"
# rescue MinilangError => error
#   puts error.message
# end

  def to_s
    str_out = "---- #{title} ----" + "\n"
    todos.each_with_index do |item, index|
      str_out << "\n" if index > 0
      str_out << item.to_s
    end
    str_out
  end

  # LS Solution
  # def to_s
  #   text = "---- #{title} ----\n"
  #   text << @todos.map(&:to_s).join("\n")
  #   text
  # end

end



# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
# todo4 = Todo.new("Go for a trail run")
list = TodoList.new("Today's Todos")

puts todo1
puts todo2
puts todo3

puts list

# ---- Adding to the list -----


# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
# list.add(todo3)                 # adds todo3 to end of list, returns list

# list.add(1)                     # raises TypeError with message "Can only add Todo objects"


# <<
# same behavior as add
puts list << todo3

# ---- Interrogating the list -----

# size
p list.size                       # returns 3


# first
puts list.first                      # returns todo1, which is the first item in the list

# last
puts list.last                       # returns todo3, which is the last item in the list

puts "********"

#to_a
puts list.to_a                      # returns an array of all items in the list

todo1.done!
todo2.done!
todo3.done!

#done?
p list.done?                     # returns true if all todos in the list are done, otherwise false

todo1.undone!
todo2.undone!
todo3.undone!



# ---- Retrieving an item in the list ----

# item_at
# list.item_at                    # raises ArgumentError
puts list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError


# ---- Marking items in the list -----

# mark_done_at
# list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

puts "&&&&&&"
puts list


# mark_undone_at
# list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

puts "After undone"
puts list


# done!
list.done!                      # marks all items as done

puts "After done!"
puts list


# ---- Deleting from the list -----

# shift
# list.shift                      # removes and returns the first item in list

# puts "After shift"
# puts list

# pop
# list.pop                        # removes and returns the last item in list

# puts "After pop"
# puts list


# remove_at
# list.remove_at                  # raises ArgumentError
list.remove_at(1)               # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError


# ---- Outputting the list -----

puts "After remove_at(1)"
puts list


# to_s
puts list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym


# Each method

list.remove_at(0)
list.remove_at(0)

puts "After remove_at(0) twice"
puts list



puts "Each method"

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo                   # calls Todo#to_s
end

puts "Select method"


# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# list = TodoList.new("Today's Todos")
# list.add(todo1)
# list.add(todo2)
# list.add(todo3)

todo1.done!

# Returns an array
# results = list.select { |todo| todo.done? }    # you need to implement this method

# puts results[0]
# puts results.inspect

# Step 2 Rewrite select so it returns a todo_list (rather than an array)

# Returns a TodoList
results = list.select { |todo| todo.done? }    # you need to implement this method

puts results

# Step 3

puts "^^^^^^^^^^^^^^^^^^"

puts list

# expected_result = <<HEREDOC
# This would contain specially formatted text.

# That might span many lines
# HEREDOC

# puts expected_result
