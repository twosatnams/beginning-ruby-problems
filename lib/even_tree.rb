# You are given a tree (a simple connected graph with no cycles). You have to
# remove as many edges from the tree as possible to obtain a forest with the
# condition that : Each connected component of the forest should contain an even
# number of vertices.

# To accomplish this, you will remove some edges from the tree. Find out the
# number of removed edges.

# ANSWER
# For a tree to be an even tree, there has to be even number of vertices

# If we remove an edge from the tree and it results in two tree with even number
# of vertices, we call that edge - even edge

# If we remove an edge from the tree and it results in two trees with odd
# number of vertices, we call that edge - odd edge

# Traverse all the edges, and remove all the even edges

require_relative 'graph_node/graph'

num_vertices, num_edges = gets.chomp.split(' ').map { |e| e.to_i }
graph = Graph.new
(1..num_vertices).to_a.each do |vertex|
  graph.add_node_by_val(vertex)
end

num_edges.times do |edge|
  first, second = gets.chomp.split(' ').map { |e| e.to_i }
  graph.add_edge_by_val(first, second, 0, false)
end

even_edges = 0
graph.edges.each do |edge|
  dup = graph.deep_dup
  first_tree = nil
  second_tree = nil
  subject_edge = nil
  dup.edges.each do |e|
    if e.first.value == edge.first.value && e.second.value == edge.second.value
      subject_edge = e
      first_tree = e.first
      second_tree = e.second
    end
  end
  dup.remove_edge(subject_edge)
  if first_tree.size.even? && second_tree.size.even?
    even_edges += 1
  end
end
puts even_edges
