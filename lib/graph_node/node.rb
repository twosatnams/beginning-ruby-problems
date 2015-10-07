class Node
  attr_accessor :value, :neighbours, :edges

  def initialize(val)
    @value = val
    @neighbours = []
    @edges = []
  end
end

def breadth_first_order(node)
  queue = [node]
  until queue.empty?
    current_node = queue.shift
    puts current_node.value
    queue << current_node.left unless current_node.left.nil?
    queue << current_node.right unless current_node.right.nil?
  end
end

def depth_first_order(node)
  return if node.nil?
  depth_first_order(node.left) unless node.left.nil?
  depth_first_order(node.right) unless node.right.nil?
  puts node.value
end
