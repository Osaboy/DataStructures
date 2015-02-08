# classes for linked list and node
require 'pry'

class Node
  attr_accessor :data
  attr_accessor :next
  
  def initialize(data, next_node = nil)
    @data = data
    @next = next_node
  end

  def to_s
    puts "#{@data} -->"
  end

end

class LinkedList
  include Enumerable

  attr_accessor :head

  def initialize(head = nil)
  
  end

  def each()   
    item = @head
    while(item)
      yield item
      item = item.next
    end
  end

  # method for inserting a new node
  def insert(node)
    node.next = @head
    @head = node
  end

  def insert_sorted(new_node)
    if (!@head || new_node.data < @head.data)
      return insert(new_node)
    end
    current_node = @head
    while (current_node.next && current_node.next.data < new_node.data)
      current_node = current_node.next
    end
    if current_node.next
      new_node.next = current_node.next
      current_node.next = new_node
    else
      current_node.next = new_node
    end
  end

  # method for obtaining data, creating a node and adding the node to the linkedlist 
  def add(data)
    new_node = Node.new(data)
    new_node.next = @head
    @head = new_node
  end

  def add_sorted(data)
    if (!@head || data < @head.data)
      return add(data)
    end
    current_node = @head
    while (current_node.next && current_node.next.data < data)
      current_node = current_node.next
    end
    current_node.next = Node.new(data,current_node.next)
  end

  # method for printing all nodes in the linkedlist
  def recursiveprint(node)
    puts node
    recursiveprint(node.next) unless node.next == nil
  end

  def to_s
    recursiveprint(@head)
  end

  def find_node_by_value(data)
    current_node = @head
    while (current_node)
      if (current_node.data == data)
        return current_node
      else
        current_node = current_node.next
      end
    end
    return nil
  end

  def remove(data)
    if (@head.data == data)
      @head = @head.next
      return true
    else
      prev_node = @head
      temp_node = prev_node.next
      until (prev_node)
        if (temp_node.data == data)
          prev_node.next = temp_node.next
          temp_node.next = nil
          return true
        else
          prev_node = prev_node.next
          temp_node = temp_node.next
        end
      end
    end
    return false
  end
end

