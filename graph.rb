class Graph
  def initialize
    @edges = Hash.new { |h, k| h[k] = Array.new }
  end

  def add_edge(v,w)
    @edges[v] << w
    @edges[w] << v
  end

  def adj(v)
    @edges[v]
  end

end

