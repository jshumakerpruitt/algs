class HeapPQ

  def initialize
    @tree = [nil]
  end

  def size
    @tree.count - 1
  end

  def insert(key)
    @tree << key
    swim(size)
  end

  def del_max
    @tree[1], @tree[size] = @tree[size], @tree[1]
    max = @tree.pop
    sink(1)
    max
  end

  def swim(i)
    while i > 1 && @tree[i] > @tree[i / 2]
     @tree[i], @tree[i / 2] = @tree[i / 2], @tree[i]
     i = i / 2
    end
    @tree
  end

  def sink(i)
    while 2 * i <= size
      j = 2 * i
      j += 1 if j + 1 <= size && @tree[j + 1] > @tree[j]
      break if @tree[i] > @tree[j]
      @tree[i], @tree[j] = @tree[j], @tree[i]
      i = j  
   end
  end
end 
