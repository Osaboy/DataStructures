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

  def search(data)
    return find_node(@root, data)
  end

  def IsEmpty?()
    return false if (@root)
    return true
  end

  private

  def insert_node(parent_node, data)
    # binary tree is not empty return parent_node as the root
    return TreeNode.new(data) unless parent_node

    if (data < parent_node.data)
      parent_node.left_child = insert_node(parent_node.left_child, data)
    else
      parent_node.right_child = insert_node(parent_node.right_child, data)
    end 
    return parent_node
  end

  def find_node(parent_node, data)
    
    return false unless parent_node
    return true if (parent_node.data == data)

    if (data < parent_node.data)
      return find_node(parent_node.left_child, data)
    else
      return find_node(parent_node.right_child, data)
    end

  end

end