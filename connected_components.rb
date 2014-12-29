class ConnectedComponents
  #application of DFS to find connected components of a graph
  def initialize(graph)
    @graph = graph
    @id_table = Hash.new { |h, k| h[k] = nil } 
    @marked = Hash.new { |h, k| h[k] = false }
    @equi_class = 0
    
    @graph.verts.each do |vert|
      unless @marked[vert]
        dfs(@graph, vert)
        @equi_class += 1
      end
    end
  end

  def connected?(v,w)
    id(v) == id(w)
  end

  def id(v)
    #returns equivalence class if vertex v
    #vertices with the same equivalence class are connected
    @id_table[v] 
  end
  
  def count
    #returns number of connected components in graph
    @equi_class
  end
  
  private
  def dfs(graph, v)
    @marked[v] = true
    @id_table[v] = @equi_class
    graph.adj(v).each do |w|
      dfs(graph, w) unless @marked[w]
    end
  end
end 
