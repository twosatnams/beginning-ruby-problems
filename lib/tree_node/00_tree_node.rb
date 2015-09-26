require 'byebug'

class PolyTreeNode
  attr_accessor :value, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def parent=(new_parent)
    parent.children.delete(self) unless parent == nil
    @parent = new_parent
    new_parent.children << self unless new_parent == nil
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child)
    raise "Not a child!" if !children.include?(child)
    child.parent = nil
  end

  def dfs(target_value)
    return self if value == target_value
    children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty? do
      test_el = queue.shift
      return test_el if test_el.value == target_value
      queue.concat(test_el.children)
    end
    nil
  end

  def bfs_display
    queue = [self]
    until queue.empty? do
      test_el = queue.shift
      print "#{test_el.children.map(&:value)  } "
      puts
      queue.concat(test_el.children)
    end
    nil
  end

  def display_parents
    return [value] if self.parent == nil
    parents = []
    parents += parent.display_parents + [self.value] 
    parents
  end

end
