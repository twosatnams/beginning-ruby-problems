require_relative 'node'
require_relative 'edge'
require 'set'

class Graph
  attr_accessor :nodes, :edges

  def initialize(nodes)
    @nodes = nodes
    @edges = Set.new
  end

  def add_node(node)
    @nodes << node
  end

  def add_edge(first, second, weight, directed = false)
    first.neighbours << second
    second.neighbours << first unless directed
    edge = Edge.new(first, second, weight, directed)
    first.edges << edge
    second.edges << edge
    @edges << edge
  end

  def add_edge_by_val(first, second, weight, directed = false)
    
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
end
