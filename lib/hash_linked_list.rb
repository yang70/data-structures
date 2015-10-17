class HashLinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def insert(node)
    current = @head
    node.nexxt = current
    @head = node
  end

  def search(key)
    if @head == nil
      nil
    else
      current = @head
      while key != current.key
        if current.nexxt.nil?
          return nil
          break
        else
          current = current.nexxt
        end
      end
      return current if current.key == key
    end
  end

  def remove(target_key)
    current = @head

    if current == @head && current.key == target_key
      @head = current.nexxt
      return current
    else
      until current.nexxt.nil?
        if current.nexxt.key == target_key
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
end

class Node
  attr_accessor :key, :value, :nexxt

  def initialize(key, value, nexxt = nil)
    @key = key
    @value = value
    @nexxt = nexxt
  end
end
