require_relative 'node'

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
  end

  def append(value)
    head.nil? ? make_head(value) : make_tail(value)
  end
  
  def prepend(value)
    head.nil? ? make_head(value) : swap_head(value)
  end
  
  def make_head(value)
    self.head = create_node(value)
  end

  def make_tail(value, node = head)
    last_node?(node) ? node.next_node = create_node(value) : make_tail(value, node.next_node)
  end

  def create_node(value = nil, next_node = nil)
    Node.new(value, next_node)
  end

  def swap_head(value)
    self.head = create_node(value, head)
  end

  def to_s(node = head, string = '')
    until last_node?(node)
      string += "( #{node.value} ) -> "
      node = node.next_node
    end
    string += "( #{node.value} ) -> nil"
  end

  def last_node?(node)
    node.next_node.nil? ? true : false
  end

  def size(node = head, size = 1)
    until last_node?(node)
      node = node.next_node
      size += 1
    end
    size
  end

  def get_head(node = head)
    node.value
  end
  
  def get_tail(node = head)
    until last_node?(node)
      node = node.next_node
    end
    node.value
  end

  def at(index, node = head)
    index.times do
      return "Index exceeds number of Nodes!" if last_node?(node)
      node = node.next_node
    end
    node
  end

  def pop(node = head)
    return node.next_node = nil if last_node?(node.next_node)
    pop(node.next_node)
  end

  def contains?(value, node = head)
    return true if node.value == value
    return false if last_node?(node)
    contains?(value, node.next_node)
  end

  def find(value, node = head, size = 0)
    return size if node.value == value
    size += 1
    find(value, node.next_node, size) rescue nil
  end
 
  def insert_at(value, index)
    return "Index exceeds number of Nodes!" if index + 1 > size
    return prepend(value) if index == 0
    at(index - 1).next_node = create_node(value, at(index))
  end

  def remove_at(index)
    return "Index exceeds number of Nodes!" if index + 1 > size
    return shift if index == 0
    at(index -1).next_node = at(index).next_node
  end

  def shift(node = head)
    return self.head = node.next_node
  end
end