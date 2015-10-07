class Edge
  attr_accessor :first, :second, :weight, :directed

  def initialize(first, second, weight, directed = false)
    @first = first
    @second = second
    @weight = weight
    @directed = directed
  end
end
