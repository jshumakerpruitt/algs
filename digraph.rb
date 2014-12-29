class Digraph
  def initialize
    @edges = Hash.new { |h, k| h[k] = [] }
  end
    
  def add_edge(v,w)
    @edges[v] << w
  end
  
  def adj(v)
    @edges[v]
  end

end
