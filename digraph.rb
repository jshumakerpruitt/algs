class Digraph
  attr_accessor :edges
  def initialize(edges = Hash.new { |h, k| h[k] = [] })
    @edges = edges 
    @cycle = [] 
    @edge_to = Hash.new { |h, k| h[k] = nil }
    @marked = Hash.new { |h, k| h[k] = nil }
    @on_stack = []
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
  
  def has_cycle?
    return true if @cycle.count > 1
    false
  end

  
  def dfs(v)
    #all credit due to Bob Sedgwick
    #stores cycle
    @on_stack[v] = true
    @marked[v] = true
    p v
    @edges[v].each do |w|
      puts 'looping'
      if has_cycle?
        puts 'has cycle'
        return
      elsif !@marked[w]
        puts 'recurse'
        @edge_to[w] = v
        dfs(w)
      elsif @on_stack[w] 
        puts 'cycle found'
        x = v
        until x == w
          @cycle << x
          x = @edge_to[x]
          puts 'building cycle'
        end
        @cycle << w
        @cycle << v 
      end
    end
    @on_stack[v] = false
  end
end

