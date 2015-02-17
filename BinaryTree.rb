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

  def delete(data)
    return delete_node(@root, data)
  end

  def is_empty?()
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

  # using an iterative process
  def find_min(target_node)
    while (target_node.left_child)
      target_node = target_node.left_child  
    end
    return target_node
  end

  # using recursion
  def find_max(target_node)
    if (!@root)
      return nil
    elsif (!target_node.right_child)
      return target_node.data
    end
    return find_max(target_node.right_child)
  end

  def delete_node(target_node, data)
    return nil if !@root

    if (data < target_node.data)
      return delete_node(target_node.left_child, data)
    elsif (data > target_node.data)
      return delete_node(target_node.right_child, data)
    else # Found the node, get ready for deletion
      # case 1: No Children
      if (target_node.left_child == nil and target_node.right_child == nil)
        target_node = nil
        return target_node
      # case 2: One child node, left child  
      elsif (target_node.left_child == nil)
        target_node = target_node.right_child
        return target_node
      # case 2: One child node, right child
      elsif (target_node.right_child == nil)
        target_node = target_node.left_child
        return target_node
      # case 3: Child nodes, left and right children
      else
        temp_node = find_min(target_node.right_child)
        target_node.data = temp_node.data
        target_node.right_child = delete_node(target_node.right_child,temp_node.data)
      end
    end
  end

end