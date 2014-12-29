class BFSPaths
  def initialize(graph)
    @graph = graph
    @visited = Hash.new { |h, k| h[k] = false }
    @edge_to = Hash.new { |h, k| h[k] = nil }
  end

  def bfs(v)
    q = [v]
    until q.empty?
      curr_vert = q.shift
      @visited[curr_vert] = true
      @graph.adj(curr_vert).each do |new_vert|
        next if @visited[new_vert]
        @edge_to[new_vert] = curr_vert
        q << new_vert
      end
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




