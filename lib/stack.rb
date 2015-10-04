require_relative 'linked_list'

class Stack
  def initialize
    @list = LinkedList.new
  end

  def push(data)
    @list.insert((Node.new data))
  end

  def pop
    @list.remove(@list.head.value)
  end

  def peek
    @list.head.value
  end
end
