class Graph
  def initialize(edges = Hash.new { |h, k| h[k] = Array.new })
    @edges = edges
  end

  def num_edges
    @edges.inject(0){ |acc, pair| acc + pair[1].count } / 2
  end

  def num_verts
    @edges.count
  end

  def verts
    @edges.keys
  end

  def add_edge(v,w)
    @edges[v] << w
    @edges[w] << v
    self
  end

  def adj(v)
    @edges[v]
  end
  
  def to_s
    @edges #TODO: something better
  end
end

