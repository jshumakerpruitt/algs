class QuickFind
  def initialize(n)
    @points = (0..(n - 1)).to_a
  end

  def connected?(p,q)
    find(p) == find(q)
  end

  def points
    @points
  end

  def union(p, q)
    p_val = points[p]
    q_val = points[q]
    points.each_with_index do |point, i|
      points[i] = q_val if points[i] == p_val
    end
    self
  end

  def find(p)
    points[p]
  end

  def cc_count
    points.uniq.count
  end
end


if __FILE__ == $PROGRAM_NAME
  qf = QuickFind.new(10)
  qf.union(4,3)
  qf.union(3,8)
  qf.union(6,5)
  qf.union(9,4)
  qf.union(2,1)
  qf.union(8,9)
  p qf.connected?(8,9)
  p !qf.connected?(5,0)
  qf.union(5,0)
  qf.union(7,2)
  qf.union(6,1)
  p qf.points == [1,1,1,8,8,1,1,1,8,8]
end
