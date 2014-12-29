class Digraph
  def initialize(edges = Hash.new { |h, k| h[k] = [] })
    @edges = edges 
  end
    
  def add_edge(v,w)
    @edges[v] << w
  end
  
  def num_edges
    @edges.inject(0) {|acc, pair| acc + pair[1].count }
  end

  def num_verts
    @edges.count
  end

  def adj(v)
    @edges[v]
  end

  def reverse
    reversed = Digraph.new
    @edges.each do |v, bag_of_edges|
      bag_of_edges.each do |edge|
        reversed.add_edge(edge, v)
      end
    end
    reversed
  end
      
end

