class LinkedList

  require_relative "node.rb"

  def initialize(first = Node.new)
    @head = first
  end

  def head
    @head
  end

  def tail(node = head)
    return node if node.next_node.nil?
    tail(node.next_node)
  end


  def size(count = 0, node = head)
    return count if node.nil?
    count += 1
    size(count, node.next_node)
  end


  def to_s(str = "", node = head)
    str += " (#{node.value}) ->"
    return str += " nil " if node.next_node.nil?
    to_s(str, node.next_node)
  end

  def at(index, count = 0, node = head)
    return node if count == index
    count += 1
    at(index, count, node.next_node)
  end


  def append(value)
    head.value != nil ? tail.next_node = Node.new(value) : @head = Node.new(value)
  end                                                                

  def prepend(value)
    size == 0 ? @head = Node.new(value) : @head = Node.new(value, head)
  end


  def pop(node = head)
    return node.next_node = nil if node.next_node == tail
    pop(node.next_node)
  end

  def contains?(value, node = head)
    return true if node.value == value
    return false if node.next_node.nil?
    contains?(value, node.next_node)
  end

  def find(value, node = head, index = 0)
    return nil unless self.contains?(value)
    return index if node.value == value
    find(value, node.next_node, index += 1)
  end

  def insert_at(value, index)
    unless head.value.nil?
      if size == 1
        self.append(value)
      else
        self.at(index-1).next_node = Node.new(value, self.at(index))
      end
    else
      self.prepend(value)
    end
  end

  def remove_at(index, count = 0, node = head)
    return node.next_node = self.at(index + 1) if count + 1 == index
    remove_at(index, count += 1, node.next_node)
  end


end


list = LinkedList.new

list.append('K')
list.append('H')
list.prepend('F')
list.prepend("halloween")
list.insert_at("J", 2)
list.remove_at(2)
puts list












