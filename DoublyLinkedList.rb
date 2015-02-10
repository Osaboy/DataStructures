class DllNode

  attr_accessor :prev, :next, :data

  def initialize (data, prev_node = nil, next_node = nil)
    @data = data
    @prev = prev_node
    @next = next_node
  end

  def to_s
    puts "#{@data} --> "
  end

end

class DoublyLinkedList

  attr_accessor :head, :tail

  def initialize
    
  end

  def find_node_by_value(data)
    
    return @tail if (@tail.data == data)

    current_node = @head

    while (current_node != @tail)
      if (current_node.data == data)
        return current_node
      else
        current_node = current_node.next
      end
    end
    return nil
  end

  def insert(data)
    new_node = DllNode.new(data)

    # insertion into empty list
    if(!@head)
      @head = new_node
      @tail = new_node
      new_node.next = @head
      new_node.prev = @hail
    # insertion at the tail end of the linked list
    else
      new_node.prev = @tail
      @tail.next = new_node
      @tail = new_node
      new_node.next = @head
      @head.prev = new_node 
    end
  end

  def remove(data)
    # dealing with an empty array
    return nil if (!@head)

    # dealing with a single element list
    if (@head == @tail)
      @head = nil 
      @tail = nil 
      return true 
    end

    # removing nodes from a list containing more than one object
    # find node
    current_node = find_node_by_value(data)
    if (current_node)
      if (current_node == @head)
        @head = head.next
        @head.prev = @tail
      elsif (current_node == @tail)
        @tail = @tail.prev
        @tail.next = @head
      else
        current_node.prev.next = current_node.next
        current_node.next.prev = current_node.prev
      end
      current_node = nil
      return true
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