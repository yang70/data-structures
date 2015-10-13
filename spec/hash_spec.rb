require 'minitest/spec'
require 'minitest/autorun'
require 'hash_table'
require 'benchmark'

describe "test that hash table is working correctly" do
  it "should insert, retrieve, delete" do
    test_hash = HashTable.new(10)

    test_hash.set("one", 1)
    test_hash.set("two", 2)
    test_hash.set("three", 3)
    test_hash.set("four", 4)
    test_hash.set("five", 5)

    puts test_hash.get("two")
    puts test_hash.delete("two")
  #   test_hash = HashTable.new(10)
  #   test_hash.set("key", "value")
  #   puts test_hash.get("key").inspect
    # keys  = %w(one two three four five)

    # (1..5).each do |val|
    #   test_hash.set(keys[val - 1], val)
    # end

    # (5..1).each do |val|
    #   test_hash.get(keys[val - 1]).must_equal val
    # end

    # puts test_hash.get("one")
  end
end
