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

puts "append "
puts linked.append(10)
puts "append "
puts linked.append(1)
puts "prepend "
puts linked.prepend(2)
puts "append "
puts linked.append(5)
puts "pop "
puts linked.pop
puts "size "
puts linked.size
puts "head "
puts linked.head
puts "tail "
puts linked.tail
puts "at "
puts linked.at(2)
puts "countains "
puts linked.countains?(1)
puts "find "
puts linked.find(1)
puts "print"
puts linked.to_s
puts linked.pop
puts linked.to_s