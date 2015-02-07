# classes for linked list and node

class Node

  attr_accessor :data
  attr_accessor :next
  
  def initialize (data, next_node = nil)
    @data = data
    @next = next_node
  end

end

class LinkedList

  attr_accessor :linklist

end