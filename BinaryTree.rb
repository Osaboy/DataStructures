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

  def insert(data)
    @root = insert_node(@root, data)
  end

  def IsEmpty?()
    return false if (@root)
    return true
  end

  private

  def insert_node(tree_node, data)
    # binary tree is not empty return tree_node as the root
    return TreeNode.new(data) unless tree_node

    if (data < tree_node.data)
      tree_node.left_child = insert_node(tree_node.left_child, data)
    else
      tree_node.right_child = insert_node(tree_node.right_child, data)
    end 
    return tree_node
  end

end