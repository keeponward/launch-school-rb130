require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    # assert_equal(@todo2, @list.first)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?)
  end

  def test_type_error
    @list.add(1)   # Induce TypeError (from Todolist#add)

  rescue TypeError => error
    assert_equal("Can only add Todo objects", error.message)

    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hi') }
  end

  def test_shovel
    @list << @todo3
    assert_equal([@todo1, @todo2, @todo3, @todo3], @list.to_a)
  end

  # LS Solution
  # def test_shovel
  #   new_todo = Todo.new("Walk the dog")
  #   @list << new_todo
  #   @todos << new_todo
  
  #   assert_equal(@todos, @list.to_a)
  # end

  # LS Solution
  def test_add_alias
    new_todo = Todo.new("Feed the cat")
    @list.add(new_todo)
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  # LS Solution
  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(true, @list.mark_done_at(0))
    assert_equal(true, @list.first.done?)

    # LS Solution
    # assert_raises(IndexError) { @list.mark_done_at(100) }
    # @list.mark_done_at(1)
    # assert_equal(false, @todo1.done?)
    # assert_equal(true, @todo2.done?)
    # assert_equal(false, @todo3.done?)

  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.item_at(100) }
    @list.first.done!
    @list.mark_undone_at(0)
    assert_equal(false, @list.first.done?)

    # LS Solution
    # assert_raises(IndexError) { @list.mark_undone_at(100) }
    # @todo1.done!
    # @todo2.done!
    # @todo3.done!
  
    # @list.mark_undone_at(1)
  
    # assert_equal(true, @todo1.done?)
    # assert_equal(false, @todo2.done?)
    # assert_equal(true, @todo3.done?)
  
  end

  def test_done_bang
    @todo1.undone!
    @todo2.undone!
    @todo3.undone!
  
    @list.done!
  
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)

    # LS Solution
    # @list.done!
    # assert_equal(true, @todo1.done?)
    # assert_equal(true, @todo2.done?)
    # assert_equal(true, @todo3.done?)
    # assert_equal(true, @list.done?)
  
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }

    @list.remove_at(0)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    # output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    # ---- Today's Todos ----
    # [ ] Buy milk
    # [ ] Clean room
    # [ ] Go to gym
    # OUTPUT

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done

    @list.mark_done_at(0)

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done

    @list.done!

    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_each

    list_copy = TodoList.new("List Copy")

    @list.each { |elem| list_copy.add(elem) }
  
    assert_equal(list_copy.to_a, @list.to_a)
  end

  def test_each_return  
    assert_equal(@list, @list.each { |elem| nil })
  end

  def test_select
    assert_equal(@list.to_a, @list.select { |todo| true }.to_a)
  end

  # LS Solution
  # def test_select
  #   @todo1.done!
  #   list = TodoList.new(@list.title)
  #   list.add(@todo1)
  
  #   assert_equal(list.title, @list.title)
  #   assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
  # end

end
