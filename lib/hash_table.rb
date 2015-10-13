require_relative 'hash_linked_list'

class HashTable
  def initialize(size)
    @size = size
    @table = []
    @size.times do
      @table << HashLinkedList.new
    end
  end

  def set(key, val)
    if get(key)
      raise "Key is already taken"
    else
      node = Node.new(key, val)
      hash(key).insert(node)
    end
  end

  def get(key)
    if hash(key).search(key)
      hash(key).search(key).value
    else
      nil
    end
  end

  def delete(key)
    hash(key).remove(key).value
  end

  private

  def hash(key)
    if key.class != String
      raise "Key must be a string"
    else
      ordinal_value = 0;

      key.chars.each do |letter|
        ordinal_value += letter.ord
      end

      bucket = ordinal_value % @size
      @table[bucket]
    end
  end
end

test_hash = HashTable.new(10)

test_hash.set("one", 1)
test_hash.set("two", 2)
test_hash.set("three", 3)
test_hash.set("four", 4)
test_hash.set("five", 5)

puts test_hash.get("two")
puts test_hash.delete("two")
