class Binary_tree
  attr_accessor :value, :left, :right

  def initialize(value, root=false)
    @value = value
    @root = root
    @left = nil
    @right = nil
  end

  def pre_order
    leftValues = []
    rightValues = []

    leftValues = @left.pre_order if @left
    rightValues = @right.pre_order if @right

    [@value].concat(leftValues).concat(rightValues)
  end

  def in_order
    leftValues = []
    rightValues = []

    leftValues = @left.in_order if @left
    rightValues = @right.in_order if @right

    leftValues.concat([@value]).concat(rightValues)
  end

  def post_order
    leftValues = []
    rightValues = []

    leftValues = @left.post_order if @left
    rightValues = @right.post_order if @right

    leftValues.concat(rightValues).concat([@value])
  end
end

# structure                  = Binary_tree.new('Tim', true)
# structure.left             = Binary_tree.new('Jony')
# structure.right            = Binary_tree.new('Phil')
# structure.left.left        = Binary_tree.new('Dan')
# structure.left.right       = Binary_tree.new('Katie')
# structure.left.right.left  = Binary_tree.new('Peter')
# structure.left.right.right = Binary_tree.new('Andrea')
# structure.right.left       = Binary_tree.new('Craig')
# structure.right.right      = Binary_tree.new('Eddie')
