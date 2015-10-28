
class HNode
  attr_accessor :key, :value, :nexxt
  def initialize(key = nil, value = nil, nexxt = nil)
    @key = key
    @value = value
    @nexxt = nexxt
  end
end

class HashLinkeydList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def insert(node)
    node.nexxt = @head
    @head = node
  end

  def search(key)
    if @head == nil
      nil
    else
      current = @head
      until current.nil?
        return current if current.key == key
        current = current.nexxt
      end
      nil
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


