require 'minitest/spec'
require 'minitest/autorun'
require 'queue'

describe "queue data structure functions work properly" do
  q  = Queue.new
  q2 = Queue.new

  it "should enqueue/dequeue correctly" do
    q.enqueue 3
    q.enqueue 6
    q.enqueue 2
    q.enqueue 9
    q.size.must_equal 4
    q.enqueue 1
    q.size.must_equal 5
    q.dequeue.must_equal 3
    q.size.must_equal 4
  end

  it "should return zero if queue is empty" do
    q2.size.must_equal 0
    q2.enqueue 6
    q2.size.must_equal 1
    q2.dequeue.must_equal 6
    q2.size.must_equal 0
  end

  it "should raise exception if dequeue an empty queue" do
    q2.dequeue.must_equal "Error - Queue appears to be empty"
  end
end
