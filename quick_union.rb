class QuickUnion
  def initialize(n)
    @id = (0..(n -1)).to_a
  end

  def connected?(p, q)
    find(p) == find(q)
  end

  def find(p)
    root = p
    until @id[root] == root
      root = @id[root]
    end
    root
  end

  def union(p, q) 
    q_root = find(q)
    p_root = find(p)
    @id[p_root] = q_root 
    self
  end

end
