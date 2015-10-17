require 'minitest/spec'
require 'minitest/autorun'
# require 'linked_list'

describe "linked list class creating correctly" do
  it "should insert corrently and set as head" do
    list = LinkedList.new
    list.insert Node.new(5)
    list.insert Node.new(3)
    list.insert Node.new(6)
    list.insert Node.new(4)
    list.insert Node.new(9)
    list.insert Node.new(1)
    list.head.value.must_equal 1
  end

  it "puts should equal correct output" do
    list = LinkedList.new
    list.insert Node.new(5)
    list.insert Node.new(3)
    list.insert Node.new(6)
    list.insert Node.new(4)
    list.insert Node.new(9)
    list.insert Node.new(1)
    list.to_s.must_equal "1, 9, 4, 6, 3, 5"
  end

  it "should search and return corrently" do
    list = LinkedList.new
    list.insert test_node = Node.new(5)
    list.insert Node.new(3)
    list.insert Node.new(6)
    list.insert Node.new(4)
    list.insert Node.new(9)
    list.insert Node.new(1)
    list.search(5).must_equal test_node
    list.search(7).must_equal nil
  end

  it "should remove correctly" do
    list = LinkedList.new
    list.insert Node.new(5)
    list.insert Node.new(3)
    list.insert Node.new(6)
    list.insert Node.new(4)
    list.insert test_remove = Node.new(9)
    list.insert Node.new(1)
    list.remove(9).must_equal test_remove
    list.to_s.must_equal "1, 4, 6, 3, 5"
  end
end
