require_relative './tree_node/00_tree_node.rb'

class KnightPathFinder
  attr_accessor :visited_positions, :move_tree

  def initialize(starting_postion)
    @starting_postion = starting_postion
    @move_tree = PolyTreeNode.new(starting_postion)
    @visited_positions = [starting_postion]
  end

  def find_path(end_pos)
    build_move_tree
    p @move_tree.bfs(end_pos).display_parents
  end

  def build_move_tree
    queue = [@move_tree]
    until queue.empty? do
      previous_move = queue.shift
      new_move_positions(previous_move.value).each do |new_move|
        #visited_positions << new_move
        move = PolyTreeNode.new(new_move)
        move.parent = previous_move
        queue += [move]
      end
    end
  end

  def new_move_positions(pos)
    result = []
    KnightPathFinder.valid_moves(pos).each do |valid_move|
      if !@visited_positions.include?(valid_move)
        result << valid_move
        visited_positions << valid_move
      end
    end
    result
  end

  def self.valid_moves(pos)
    x, y = pos[0], pos[1]
    possible_moves = [[1,2],[2,1],[-1,2],[-2,1],[1,-2],[2,-1],[-1,-2],[-2,-1]]
    result = possible_moves.select do |possible_move|
      pos_x, pos_y = possible_move[0], possible_move[1]
      x + pos_x > -1 && x + pos_x < 8 &&
      y + pos_y > -1 && y + pos_y < 8
    end
    result.map {|valid_move| [x + valid_move[0] ,  y + valid_move[1]]}
  end

end

a = KnightPathFinder.new([0,0])
x = a.find_path([6,2])
