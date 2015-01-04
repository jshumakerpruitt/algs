# #----------------------------------------------------# #
# TODO: 0) documentation
#       1) #keys, #vals
#       2) auxilliary functions: rank(key),
#          select(nth el), floor(key), ceiling(key)...
# #----------------------------------------------------# #
class RedBlackBST
  def initialize
    @root = nil
  end

  def insert(key, value)
    @root = put(@root, key, value)
  end

  def put(node, key, value)
    return Node.new(key, value, :r) if node.nil?
      
    if node.key == key
      node.value = value
    elsif key < node.key
      node.left = put(node.left, key, value)
    else
      node.right = put(node.right, key, value)
    end

    node = rotate_left(node) if red?(node.right) && !red?(node.left)
    node = rotate_right(node) if red?(node.left) && red?(node.left.left)
    flip_colors(node) if red?(node.left) && red?(node.right)
    return node
  end

  def find(key)
    node = get(key)
    if node.nil?
      nil
    else
      node.value
    end
  end

  def get(key)
    node = @root
    until node.nil?
      if node.key < key
        node = node.right
      elsif node.key > key
        node = node.left
      else
        return node
      end
    end
    return nil
  end

  def delete(key)
    return false if find(key).nil?
    node = get(key)
    successor = min_node(node.right) 
    node.value = successor.value 
    node.key = successor.key
    del_min(node.right)
  end

  def del_min(node)
    return false if node.nil?
    if node.left.left.nil?
      node.left = nil
      true
    else
      del_min(node.left)
    end
  end

  def min_node(node)
    if node.nil?
      nil
    elsif node.left.nil?
      node
    else
      min_node(node.left)
    end
  end

  def del_max(node)
    return false if node.nil?
    if node.right.right.nil?
      node.right = nil
      true
    else
      del_max(node.right)
    end
  end

  def flip_colors(node)
    node.left.color = :b
    node.right.color = :b
    node.color = :r
  end

  def rotate_left(node)
    x = node.right
    node.right = x.left
    x.left = node
    x.color = node.color
    node.color = :r
    return x
  end

  def rotate_right(node)
    x = node.left
    node.left = x.right
    x.right = node
    x.color = node.color
    node.color = :r
    return x
  end

  def red?(node)
    return false if node.nil?
    node.color == :r
  end
end


class Node
  attr_accessor :key, :value, :right, :left, :color
  def initialize(key, val, color)
    @left = nil
    @right = nil
    @key = key
    @value = val
    @color = color
  end


end
