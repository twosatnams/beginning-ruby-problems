class Node
  attr_accessor :value, :neighbours, :edges

  def initialize(val)
    @value = val
    @neighbours = []
    @edges = []
  end

  def size
    queue = [self]
    visited = []
    count = 0
    until queue.empty?
      current_node = queue.shift
      visited << current_node
      count += 1
      neighbours = current_node.neighbours - visited
      queue.concat(neighbours)
    end
    return count
  end
end
