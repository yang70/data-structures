require_relative 'hash_linked_list'

class HashTable
  def initialize(size)
    @size = size
    @table = []
    @size.times do
      @table << HashLinkeydList.new
    end
  end

  def set(key, val)
    if get(key)
      raise "key is already taken"
    else
      node = HNode.new(key, val)
      @table[hash key].insert node
    end
  end

  def get(key)
    node = @table[hash key].search key
    return node.value unless node.nil?
    nil
  end

  def delete(key)
    get(key).nil? ? nil : @table[hash key].remove(key).value
  end

  private

  def hash(key)
    if key.class != String
      raise "key must be a string"
    else
      ordinal_value = 0;

      key.chars.each do |letter|
        ordinal_value += letter.ord
      end

      ordinal_value % @size
    end
  end
end
