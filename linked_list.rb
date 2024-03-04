class LinkedList
  def initialize
    @head = nil
  end

  def is_empty?
    return true if @head.nil?

    false
  end

  def head
    node = @head
    node.nil? ? nil : node.value
  end

  def tail
    node = @head
    loop do
      return node.value if node.next.nil?

      node = node.next
    end
  end

  def append(value)
    if is_empty?
      @head = Node.new(value)
    else
      curr_node = @head
      new_node = Node.new(value)
      curr_node = curr_node.next until curr_node.next.nil?
      curr_node.next = new_node
    end
  end

  def prepend(value)
    if is_empty?
      @head = Node.new(value)
    else
      curr_node = Node.new(value)
      curr_node.next = @head
      @head = curr_node
    end
  end

  def size
    if is_empty?
      count = 0
    else
      count = 1
      curr_node = @head
      until curr_node.next.nil?
        curr_node = curr_node.next
        count += 1
      end
      count
    end
  end

  def at(index)
    return nil if is_empty?

    count = 0
    curr_node = @head
    until curr_node.nil?
      return curr_node.value if count == index

      curr_node = curr_node.next
      count += 1
    end
  end

  def pop
    return 'Empty' if is_empty?

    curr_node = @head
    curr_node = curr_node.next until curr_node.next.next.nil?
    last_node = curr_node.next
    curr_node.next = nil

    last_node
  end

  def countains?(value)
    if is_empty?
      false
    else
      curr_node = @head
      until curr_node.nil?
        return true if curr_node.value == value

        curr_node = curr_node.next
      end
      false
    end
  end

  def find(value)
    if is_empty?
      nil
    else
      count = 0
      curr_node = @head
      until curr_node.nil?
        return count if curr_node.value == value

        curr_node = curr_node.next
        count += 1
      end
      nil
    end
  end

  def insert_at(value, index)
    new_node = Node.new(value)
    if index == 0
      node = @head
      @head = new_node
      return @head.next = node
    end
    count = 0
    curr_node = @head
    until count == index
      curr_node = curr_node.next
      count += 1
    end

    next_node = curr_node.next
    curr_node.next = new_node
    new_node.next = next_node
  end

  def remove_at(index)
    if index == 0
      node = @head
      return @head = node.next
    end
    count = 0
    node = @head
    until (count + 1) == index
      node = node.next
      count += 1
    end

    curr_node = node.next
    next_node = curr_node.next
    prev_node = node
    prev_node.next = next_node
    curr_node
  end

  def to_s
    curr_node = @head
    print_list = ''
    loop do
      return print_list += 'nil' if curr_node.nil?

      print_list += "(#{curr_node.value}) -> "
      curr_node = curr_node.next
    end
    print_list
  end
end

class Node
  attr_accessor :next
  attr_reader   :value

  def initialize(value)
    @value = value
    @next  = nil
  end

  def to_s
    "#{value}"
  end
end

linked = LinkedList.new

linked.append(1)
linked.append(2)
linked.append(3)
linked.append(4)
linked.append(5)
puts linked.remove_at(0)
puts linked
linked.insert_at(3, 0)
puts linked
