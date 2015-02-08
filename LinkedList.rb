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

  def insert_sorted(node)
    if (!@head)
      return insert(node)
    end
  end

  # method for obtaining data, creating a node and adding the node to the linkedlist 
  def add(data)
    new_node = Node.new(data)
    new_node.next = @head
    @head = new_node
  end

  # method for printing all nodes in the linkedlist
  def recursiveprint(node)
    puts node
    recursiveprint(node.next) unless node.next == nil
  end

  def to_s
    recursiveprint(@head)
  end

end

