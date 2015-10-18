require_relative 'graph_node/graph'

test_cases = gets.chomp.to_i
nLadders = gets.chomp.to_i
ladders = {}
nladders.times do
  from, to = gets.chomp.split(' ').map { |pos| pos.to_i }
  ladders[from] = to;
end
nSnakes = gets.chomp.to_i
snakes = {}
nSnakes.times do
  from, to = gets.chomp.split(' ').map { |pos| pos.to_i }
  snakes[from] = to
end

# construct graph
def construct_board(ladders, snakes)
  board = Graph.new
  (1..100).to_a.each do |cell|
    node = Node.new(cell)
    board.add_node(node)
  end

  # add ladders
  ladders.each do |from, to|
    board.nodes.each do |node|
      first = node if node.value == from
      second = node if node.value == to
    end
    board.add_edge(first, second, 0, true)
  end

  # add snakes
  snakes.each do |from, to|
    board.node.each do |node|
      first = node if node.value == from
      second = node if node.value == to
    end
    board.add_edge(second, first, 0, true)
  end

  # add other edges
  board.nodes.each_with_index do |node, idx|
    next_six = []
    ((idx + 1)..(idx + 7)).to_a.each do |pos|
      if ladders[pos] || snakes[pos]
        next
      end
      next_six << board.nodes[pos]
    end

    next_six.each do |pos_node|
      board.add_edge(node, pos_node, 0, true)
    end
  end
end
