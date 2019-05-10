# 
# linked_list.rb
# 
# 
# 

class Node
  attr_accessor :value
  attr_accessor :next_node

  def initialize
    @value = nil
    @next_node = nil
  end
end

class LinkedList
  attr_reader :head
  attr_reader :tail
  attr_reader :size
  
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end
  
  # append adds a new node to the end of the list
  def append
    if @size == 0
      @head = Node.new
      @tail = @head
    elsif @size == 1
      new_node = Node.new
      @head.next_node = new_node
      @tail = new_node
    else
      new_node = Node.new
      search_node = @tail
      search_node.next_node = new_node
      @tail = new_node
    end

    @size += 1
    @tail
  end
  
  # prepend adds a new node to the start of the list
  def prepend
    if @size == 0
      @head = Node.new
      @tail = @head
    elsif @size == 1
      @head = Node.new
      @head.next_node = @tail
    else
      new_node = Node.new
      new_node.next_node = @head
      @head = new_node
    end

    @size += 1
    @head
  end

  # at(index) returns the node at the given index
  def at(index)
    if index >= @size
      return nil
    elsif index == 0
      return @head
    end
    search_index = @head
    index.times {
      search_index = search_index.next_node
    }
    return search_index
  end

  # pop removes the last element from the list
  def pop
    if @size == 0
      return @tail
    elsif @size == 1
      @head = nil
      @tail = nil
      @size = 0
    else
      search_index = @head
      while search_index.next_node != @tail
        search_index = search_index.next_node
      end
      @tail = search_index
      @tail.next_node = nil
      @size -= 1
    end
    @tail
  end

  # contains? returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    retval = false
    if @size == 0
      return false
    else
      search_index = @head
      loop {
        if search_index == nil
          break;
        end
        if search_index.value == value
          return true
        end
        search_index = search_index.next_node
      }
    end
    retval
  end

  # find(data) returns the index of the node containing data, or nil if not found.
  def find(data)
    if @size == 0
      return nil
    elsif @size == 1
      if @head == data
        return 0
      else
        return nil
      end
    else
      search_index = @head
      index = 0
      while search_index != nil && search_index.value != data
        search_index = search_index.next_node
        index += 1
      end
      return search_index == nil ? nil : index
    end
  end

  # to_s represent your LinkedList objects as strings, so you can print them out and preview
  # them in the console. The format should be: ( data ) -> ( data ) -> ( data ) -> nil
  def to_s
    index_node = @head
    out_str = ""
    while index_node != nil
      out_str += "( " + index_node.value.to_s + " )"
      if index_node.next_node != nil
        out_str += " -> "
      end
      index_node = index_node.next_node
    end
    print out_str
  end
  
  # insert_at(index) that inserts the node at the given index
  def insert_at(index)
    if index < 0 || index >= @size
      return nil
    end

    next_to_last = nil
    new_node = nil
    if index == 0
      return prepend
    elsif index == @size-1
      return append
    else
      search_index = @head
      index.times {|i|
        if i == index - 1
          next_to_last = search_index
        end
        search_index = search_index.next_node
      }
      new_node = Node.new
      next_to_last.next_node = new_node
      new_node.next_node = search_index
    end
    @size += 1
    new_node
  end

  # remove_at(index) that removes the node at the given index.
  # (You will need to update the links of your nodes in the list when you remove a node.)
  def remove_at(index)
    if index < 0 || index >= @size
      return nil
    end

    if index == @size - 1
      return pop
    else
      search_index = @head
      next_to_last = nil
      index.times {|i|
        if i == index - 1
          next_to_last = search_index
        end
        search_index = search_index.next_node
      }
      next_to_last.next_node = search_index.next_node
    end
    @size -= 1
  end
  
end ## class
############################################


list = LinkedList.new

node = list.append
node.value = 1

node = list.append
node.value = 2

node = list.append
node.value = 3

node = list.append
node.value = 4

puts list.to_s
puts list.size

node = list.prepend
node.value = 100

node = list.prepend
node.value = 200

node = list.prepend
node.value = 300

node = list.prepend
node.value = 400

puts list.to_s
puts list.size

list.pop
list.pop
list.pop
list.pop

puts list.to_s
puts list.size

puts list.contains?(300)
puts list.contains?(3)

puts list.at(2).value

puts list.find(300)

puts ""
puts "========================"
puts ""

list1 = LinkedList.new

puts list1.size
puts list1.at(0)
puts list1.pop
puts list1.contains?(1)
puts list1.find(1)
puts list1.to_s

(list1.append).value = 1
(list1.append).value = 2
(list1.append).value = 3
(list1.append).value = 4
puts list1.size
puts list1.at(0)
puts list1.pop
puts list1.contains?(1)
puts list1.find(1)
puts list1.to_s
puts list1.find(7)
puts list1.at(7)
(list1.insert_at(1)).value = 'a'
puts list1.to_s
list1.remove_at(1)
puts list1.to_s
