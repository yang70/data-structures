require 'minitest/spec'
require 'minitest/autorun'
require 'stack'

describe "confirm stack is working correctly" do
  it "should push data" do
    s = Stack.new
    s.push(5)
    s.push(4)
    s.push(8)
    s.peek.must_equal 8
  end

  it "should pop data" do
    s = Stack.new
    s.push(5)
    s.push(4)
    s.push(8)
    s.pop.value.must_equal 8
    s.peek.must_equal 4
    s.pop.value.must_equal 4
    s.peek.must_equal 5
  end
end
