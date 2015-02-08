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
      new_node.next = @head 
      @tail = new_node  
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