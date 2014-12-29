class DFSPaths
  def initialize(graph)
    @edge_to = Hash.new { |h, k| h[k] = nil }
    @visited = Hash.new { |h, k| h[k] = false }
    @graph = graph
  end

  def dfs(v)
    @visited[v] = true
    @graph.adj(v).each do |vert|
      next if @visited[vert]
      @edge_to[vert] = v
      dfs(vert)
    end
    @edge_to
  end

  def connected?(w)
    @visited[w]
  end

  def path_to(w)
   return nil unless connected?(w)
    path = [w]
    until @edge_to[w].nil?
      path.unshift @edge_to[w]
      w = @edge_to[w]
    end
    path
  end
end

