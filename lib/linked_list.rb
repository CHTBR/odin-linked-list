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
end
