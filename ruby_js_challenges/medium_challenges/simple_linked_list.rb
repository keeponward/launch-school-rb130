# The Element class should have several methods as follows:

# a constructor that expects at least one argument. The first argument is the data value to be stored in the newly created element. The second optional argument is another Element object that will be the next element after the newly created element. If it seems odd to you that the more recently created element would be placed before the already-existing element, remember that our linked list is meant to resemble a push-down/pop-off stack. With such stacks, the most recently added (pushed) elements are the ones that get removed (popped) first. They are commonly known as LIFO stacks: Last In, First Out.

# a method that returns the data value of the Element.

# a method that returns a boolean that indicates whether the current element is the tail of the list: the last one in the list. The tail element does not have another Element instance stored in the next field.

# a method that returns the next Element in the linked list. If the current element is the tail, we should return a value indicating the absence of a next element (e.g., null or nil).

class EmptyStackError < StandardError; end


class Element

  attr_reader :data, :next_elem

  def initialize(data, next_elem=nil)
    @data = data
    @next_elem = next_elem      
  end

  def datum
    data
  end

  def tail?
    !next_elem
  end

  def next
    next_elem
  end
  
end

class SimpleLinkedList

  attr_accessor :head_elem

  def initialize
    @head_elem = nil
  end

  def size
    num_elems = 0
    curr_element = head_elem
    while curr_element
      num_elems += 1
      curr_element = curr_element.next
    end
    num_elems
  end

  def push(data)
    @head_elem = Element.new(data, head_elem)
  end

  def pop
    if head_elem == nil
      raise EmptyStackError, "Nothing to pop"
    else
      pop_data = head_elem.datum
      @head_elem = head_elem.next ? head_elem.next : nil
    end
    pop_data
  end

  def empty?
    !head_elem
  end

  def peek
    head_elem ? head_elem.datum : nil
  end

  def self.from_a(data_arr)
    newList = SimpleLinkedList.new
    data_arr && data_arr.reverse_each do |data|
      newList.push(data)
    end
    newList
  end

  def head
    head_elem
  end

  def to_a
    out_arr = []
    curr_element = head_elem
    while curr_element
      out_arr << curr_element.datum
      curr_element = curr_element.next
    end
    out_arr
  end

  def reverse
    newList = SimpleLinkedList.new
    arr = self.to_a
    arr.each do |data|
      newList.push(data)
    end
    newList
  end
end

# list = SimpleLinkedList.new
# list.push(1)
# puts list.size
# list.pop

# SimpleLinkedList.from_a([])

# list = SimpleLinkedList.from_a([1])
# puts list.to_a == [1]
# puts list.size == 1
# puts list.peek == 1

