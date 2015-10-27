require 'minitest/spec'
require 'minitest/autorun'
require 'binary_tree'

bin_tree                  = Binary_tree.new('Tim', true)
bin_tree.left             = Binary_tree.new('Jony')
bin_tree.right            = Binary_tree.new('Phil')
bin_tree.left.left        = Binary_tree.new('Dan')
bin_tree.left.right       = Binary_tree.new('Katie')
bin_tree.left.right.left  = Binary_tree.new('Peter')
bin_tree.left.right.right = Binary_tree.new('Andrea')
bin_tree.right.left       = Binary_tree.new('Craig')
bin_tree.right.right      = Binary_tree.new('Eddie')

pre_order_array = %w(Tim Jony Dan Katie Peter Andrea Phil Craig Eddie)
in_order_array = %w(Dan Jony Peter Katie Andrea Tim Craig Phil Eddie)
post_order_array = %w(Dan Peter Andrea Katie Jony Craig Eddie Phil Tim)

describe "test the 3 different traversal methods" do
  it "traverses pre_order correctly" do
    bin_tree.pre_order.must_equal pre_order_array
  end

  it "traverses in_order correctly" do
    bin_tree.in_order.must_equal in_order_array
  end

  it "traverses post_order correctly" do
    bin_tree.post_order.must_equal post_order_array
  end
end
