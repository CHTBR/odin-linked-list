require_relative "node"

class EmptyList < StandardError
  def initialize(msg = "Can't perform operation on an empty list")
    super
  end
end

# A class for managing a linked list DS and containing related methods
class LinkedList
  attr_accessor :head_address, :size

  def initialize(*args)
    @size = 0
    return unless args[0]

    initial_args = args[0]
    @size = initial_args.size
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
    @size += 1
    new_node = Node.new(data)
    if head_address.nil?
      @head_address = new_node
      return
    end

    last_node = _traverse
    last_node.next_address = new_node
  end

  def list_prepend(data)
    @size += 1
    new_node = Node.new(data)
    new_node.next_address = head_address
    @head_address = new_node
  end

  def at(index)
    raise TypeError unless index.instance_of? Integer
    return nil if index >= size

    _traverse(index).data
  end

  def pop
    raise EmptyList.new("Can't perform pop on an empty list") unless head_address

    before_last_node = _traverse(size - 2)
    last_node = before_last_node.next_address
    before_last_node.next_address = nil
    last_node.data
  end

  def contains?(value)
    current_node = head_address
    current_node = current_node.next_address until current_node.data == value || current_node.next_address.nil?
    return true if current_node.data == value

   false 
  end

  def find(value)
    current_node = head_address
    index = 0
    until current_node.data == value || current_node.next_address.nil?
      current_node = current_node.next_address
      index += 1
    end
    return index if current_node.data == value

    nil
  end

  def insert_at(index, value)
    new_node = Node.new(value)
    node_before_index = _traverse(index - 1)
    new_node.next_address = node_before_index.next_address
    node_before_index.next_address = new_node
  end

  private

  def _traverse(*optional_index)
    index = optional_index[0] || -1
    current_node = head_address
    until current_node.next_address.nil? || index.zero?
      current_node = current_node.next_address
      index -= 1
    end
    current_node
  end
end
