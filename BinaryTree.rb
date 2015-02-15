class TreeNode
  attr_accessor :data, :left_child, :right_child

  def initialize (data)
    @data = data
    @left_child = nil
    @right_child = nil
  end

end

class BinaryTree

  attr_accessor :root

  def initialize
    @root = nil
  end

end