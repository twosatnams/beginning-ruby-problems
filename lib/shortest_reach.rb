# Given an undirected graph consisting of N nodes (labelled 1 to N) where a
# specific given node S represents the start position and an edge between any
# two nodes is of length 6 units in the graph.
#
# It is required to calculate the shortest distance from start position (Node S)
# to all of the other nodes in the graph.

# Input Format
#
# The first line contains T, denoting the number of test cases.
# First line of each test case has two integers N, denoting the number of nodes
# in the graph and M, denoting the number of edges in the graph.
# The next M lines each consist of two space separated integers x y, where
# x and y denote the two nodes between which the edge exists.
# The last line of a testcase has an integer S, denoting the starting position.

require_relative 'graph_node/graph.rb'

gets.chomp.to_i.times do
  num_nodes, num_edges = gets.chomp.split(" ").map { |i| i.to_i }

  nodes = []
  (1..num_nodes).each do |val|
    nodes << Node.new(val)
  end
  graph  = Graph.new(nodes)

  edges = []
  num_edges.times do |edge|
    first, second = gets.chomp.split(" ").map { |i| i.to_i }
    first = nodes[first - 1]
    second = nodes[second - 1]
    graph.add_edge(first, second, 6)
  end

  start = nodes[gets.chomp.to_i - 1]

  distances = {}
  previous = {}
  vertices = nodes.dup
  nodes.each do |node|
    distances[node] = Float::INFINITY
    previous[node] = nil
  end

  distances[start] = 0

  until vertices.empty?
    near_dist = Float::INFINITY
    nearest = nil
    vertices.each do |vertex|
      nearest = vertex if distances[vertex] < near_dist
    end
    vertices.delete(nearest)

    graph.edges_from(nearest).each do |edge|
      distance = edge.weight + distances[nearest]
      other_vertex = edge.first == nearest ? edge.second : edge.first
      if distance <= distances[other_vertex]
        distances[other_vertex] = distance
        previous[other_vertex] = nearest
      end
    end
  end

  result = []
  distances.values.each do |val|
    if val != 0
      if val == Float::INFINITY
        result << -1
      else
        result << val
      end
    end
  end
  puts result.join(' ')
end
