require_relative "node"

# A class for managing a linked list DS and containing related methods
class LinkedList
  attr_accessor :head

  def initialize(*args)
    return unless args[0]

    initial_args = args[0]
    @head = Node.new(initial_args[0])
    current_node = head
    initial_args[1..].each do |element|
      new_node = Node.new(element)
      current_node.next_address = new_node
      current_node = new_node
    end
  end

  def to_s
    return nil if head.data.nil?

    data_arr = []
    current_node = head
    until current_node.nil?
      data_arr << current_node.data
      current_node = current_node.next_address
    end
    data_arr << "nil"
    data_arr.join(" -> ")
  end

  def tail
    return "nil" if head.nil?

    last_node = _traverse
    last_node.data
  end

  private

  def _traverse
    current_node = head
    current_node = current_node.next_address until current_node.next_address.nil?
    current_node
  end
end
