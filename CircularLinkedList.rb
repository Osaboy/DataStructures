  class Node
  attr_accessor :data, :next, :tail, :head 

  def initialize(data, next_node = nil)
    @data = data
    @next = next_node
  end

  def to_s
    puts "#{@data} --> "
  end

end

class CLinkedList

  attr_accessor :head, :tail

  def initialize

  end

   # method for obtaining data, creating a node and adding the node to the linkedlist 
  def insert(data)
    new_node = Node.new(data)
    if !@head
      new_node.next = new_node
      @head = new_node
      @tail = @head
    else
      @tail.next = new_node
      @tail = new_node
      new_node.next = @head       
    end
  end

  def find_node_by_value(data)
    current_node = @head
    if (current_node.data == data)
      return current_node
    end
    while (current_node && current_node.next != @tail.next)
      if (current_node.data == data)
        return current_node
      else
        current_node = current_node.next
      end
    end
    return nil
  end

  def remove(data)
    # dealing with an empty array
    return nil if (!@head)
    
    # removing the head
    if (@head.data == data)
      if (@head == @tail)
        @head = nil
        @tail = nil
        return true
      end
      @tail.next = @head.next
      @head = @head.next
      return true
    end

    prev_node = @head
    current_node = @head.next
    while (current_node != @head)
      if (current_node.data == data)
        prev_node.next = current_node.next
        current_node.next = nil
        # removing the tail
        if (current_node == @tail)
          @tail = prev_node
        end
        return true
      end
      current_node = current_node.next
    end
    return false
  end

  # method for printing all nodes in the linkedlist
  def recursiveprint(node)
    puts node
    recursiveprint(node.next) unless node.next == tail.next
  end

  def to_s
    recursiveprint(@head)
  end

end

