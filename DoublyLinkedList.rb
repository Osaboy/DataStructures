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

  def insert(data)
    new_node = DllNode.new(data)

    # Insertion into empty list
    if(!@head)
      @head = new_node
      @tail = new_node
      new_node.next = @head
      new_node.prev = @hail
    else
      new_node.prev = @tail
      @tail.next = new_node
      @tail = new_node
      new_node.next = @head
      @head.prev = new_node 
    end

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