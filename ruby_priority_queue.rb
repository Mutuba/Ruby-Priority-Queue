class Element
  include Comparable

  attr_accessor :name, :priority

  def initialize(name, priority)
    @name = name
    @priority = priority
  end

  def <=>(other)
    return if other.nil?

    @priority <=> other.priority
  end
end

class NaivePriorityQueue
  def initialize
    @elements = []
  end

  # Inserting at the end of a list takes constant time O(1)
  def <<(element)
    @elements << element
  end

  # deleting at the end of a list takes constant time O(1)
  def pop
    # get the position of the last element
    last_element_index = @elements.size - 1
    # not sure if we need this operation
    # @elements.sort!
    # remove the element with highest priority
    @elements.delete_at(last_element_index)
  end
end

# q = NaivePriorityQueue.new
# q << Element.new('bar', 1)
# q << Element.new('foo', 3)
# q << Element.new('baz', 2)
# q << Element.new('mutuba', 4)
# q << Element.new('daniel', 5)
# q << Element.new('pearl', 6)
# q << Element.new('paul', 7)
# q << Element.new('oliver', 8)

# p q.pop.name # => "foo"

class PriorityQueue
  def initialize
    @elements = []
  end

  def <<(element)
    @elements << element
    # bubble up the element that we just added
    # insertion is at the end, but bubbling up makes sure it is in the right place
    # also called swim, or heapify up
    bubble_up(@elements.size - 1)
  end

  def pop
    # exchange the root with the last element
    exchange(1, @elements.size - 1)

    # remove the last element of the list
    # this was initially the root node
    last_element = @elements[@elements.size - 1]

    @elements.delete_at(@elements.size - 1)
    # max = @elements.pop

    # and make sure the tree is ordered again
    bubble_down(1)
    last_element
  end

  def bubble_up(index)
    # return if we reach the root element
    # cannot go beyond this
    return if index <= 1

    # get the parent
    parent_index = (index / 2)

    # or if the parent is already greater than the child
    return if @elements[parent_index] >= @elements[index]

    # otherwise we exchange the child with the parent
    exchange(index, parent_index)

    # and keep bubbling up or the element keeps swimming
    bubble_up(parent_index)
  end

  def exchange(source, target)
    @elements[source], @elements[target] = @elements[target], @elements[source]
  end

  def bubble_down(index)
    # calculate child index first
    child_index = (index * 2)

    # # stop if we reach the bottom of the tree
    return if child_index > @elements.size - 1

    # make sure we get the smallest child

    largest_index = index

    # if left child is larger than root (index), child index is left index
    largest_index = child_index if !@elements[child_index].nil? &&
                                   @elements[child_index] > @elements[largest_index]

    if @elements[child_index + 1] != nil &&
       @elements[child_index + 1] > @elements[largest_index]
      largest_index = child_index + 1
    end

    # if element is in position
    return unless largest_index != index

    exchange(largest_index, index)
    bubble_down(largest_index)
  end
end

q = PriorityQueue.new
q << Element.new('bar', 1)
q << Element.new('foo', 3)
q << Element.new('baz', 2)
q << Element.new('mutuba', 4)
q << Element.new('daniel', 5)
q << Element.new('pearl', 6)
q << Element.new('paul', 7)
q << Element.new('oliver', 8)

p q.pop.name # => "oliver
p q.pop.name # => "daniel
p q.pop.name # => "oliver
p q.pop.name # => "oliver
