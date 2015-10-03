class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def insert(node)
    current = @head
    node.nexxt = current
    @head = node
  end

  def search(value)
    current = @head
    while value != current.value
      if current.nexxt == nil
        return nil
        break
      else
        current = current.nexxt
      end
    end
    return current if current.value == value
  end

  def remove(target_val)
    current = @head

    if current == @head && current.value == target_val
      @head = current.nexxt
      return current
    else
      while current.nexxt != nil
        if current.nexxt.value == target_val
          target = current.nexxt
          current.nexxt = current.nexxt.nexxt
          return target
          break
        else
          current = current.nexxt
        end
      end
      return nil
    end
  end

  def to_s
    current = @head
    string = "#{current.value}"

    while current.nexxt != nil
      current = current.nexxt
      string += ", #{current.value}"
    end

    string
  end
end

class Node
  attr_accessor :value, :nexxt

  def initialize(value, nexxt = nil)
    @value = value
    @nexxt = nexxt
  end
end
