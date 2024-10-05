require_relative "node"

# A class for managing a linked list DS and containing related methods
class LinkedList
  attr_accessor :head_address

  def initialize(*args)
    return unless args[0]

    initial_args = args[0]
    @head_address = Node.new(initial_args[0])
    current_node = head_address
    initial_args[1..].each do |element|
      new_node = Node.new(element)
      current_node.next_address = new_node
      current_node = new_node
    end
  end

  def to_s
    return nil if head_address.data.nil?

    data_arr = []
    current_node = head_address
    until current_node.nil?
      data_arr << current_node.data
      current_node = current_node.next_address
    end
    data_arr << "nil"
    data_arr.join(" -> ")
  end

  def tail
    return "nil" if head_address.nil?

    last_node = _traverse
    last_node.data
  end

  def head
    head_address.data
  end

  def append(data)
    new_node = Node.new(data)
    if head_address.nil?
      @head_address = new_node
      return
    end

    last_node = _traverse
    last_node.next_address = new_node
  end

  def list_prepend(data)
    new_node = Node.new(data)
    new_node.next_address = head_address
    @head_address = new_node
  end

  private

  def _traverse(*optional_index)
    index = optional_index[0] || -1
    current_node = head_address
    until current_node.next_address.nil? || index == 0
      current_node = current_node.next_address
      index -= 1
    end
    current_node
  end
end
