require_relative 'linked_list'

class Queue

  def initialize
    @list = LinkedList.new
  end

  def enqueue(value)
    new_node = Node.new value
    if find_last.nil?
      @list.head = new_node
    else
      find_last.nexxt = new_node
    end
  end

  def dequeue
    if @list.head.nil?
      "Error - Queue appears to be empty"
    else
      value = @list.head.value
      @list.remove(@list.head.value)
      value
    end
  end

  def size
    if @list.head == nil
      0
    else
      count = 1
      current = @list.head
      while current.nexxt != nil
        current = current.nexxt
        count += 1
      end
      count
    end
  end

  private

  def find_last
    if @list.head == nil
      nil
    else
      current = @list.head
      while current.nexxt != nil
        current = current.nexxt
      end
      current
    end
  end
end
