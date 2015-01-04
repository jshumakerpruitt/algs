class WeightedQuickUnion
  attr_accessor :cc_count
  def initialize(n)
    @id = (0..(n -1)).to_a
    @size = Array.new(n){ 1 } #size of each subtree
    @cc_count = n
  end

  def connected?(p, q)
    find(p) == find(q)
  end

  def find(p)
    root = p
    until @id[root] == root
      @id[root] == @id[@id[root]]  
      root = @id[root]
    end
    root
  end

  def union(p, q) 
    q_root = find(q)
    p_root = find(p)
    return if p_root == q_root
    if @size[p_root] < @size[q_root]
      @id[p_root] = q_root 
      @size[q_root] += @size[p_root]
    else
      @id[q_root] = p_root
      @size[p_root] += @size[q_root]
    end
    @cc_count -= 1
    self
  end

end
