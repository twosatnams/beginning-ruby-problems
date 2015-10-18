require_relative 'node'
require_relative 'edge'

class Graph
  attr_accessor :nodes, :edges

  def initialize
    @nodes = []
    @edges = []
  end

  def add_node(node)
    @nodes << node
  end

  def add_node_by_val(val)
    @nodes << Node.new(val)
  end

  def add_edge(first, second, weight, directed = false)
    first.neighbours << second
    second.neighbours << first unless directed
    edge = Edge.new(first, second, weight, directed)
    first.edges << edge
    second.edges << edge unless directed
    @edges << edge
  end

  def add_edge_by_val(first, second, weight, directed = false)
    first_node = nil
    second_node = nil
    @nodes.each do |node|
      first_node = node if node.value == first
      second_node = node if node.value == second
    end
    add_edge(first_node, second_node, weight, directed)
  end

  def edges_from(node)
    result = []
    @edges.each do |edge|
      if (edge.directed)
        result << edge if edge.first == node
      else
        result << edge if edge.first == node || edge.second == node
      end
    end
    result
  end

  def remove_edge(edge)
    first = edge.first
    second = edge.second
    first.neighbours.delete(second)
    second.neighbours.delete(first) unless edge.directed
    first.edges.delete(edge)
    second.edges.delete(edge) unless edge.directed
    @edges.delete(edge)
  end

  def deep_dup
    graph = Graph.new
    @nodes.each do |node|
      graph.add_node(Node.new(node.value))
    end
    @edges.each do |edge|
      graph.add_edge_by_val(edge.first.value, edge.second.value, edge.weight, edge.directed)
    end
    graph
  end

end
