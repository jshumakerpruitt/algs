# #----------------------------------------------------# #
# TODO: 1) #keys, #vals
#       2) auxilliary functions: rank(key),
#          select(nth el), floor(key), ceiling(key)...
# #----------------------------------------------------# #
class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(key, value)
    @root = put(@root, key, value)
  end

  def put(node, key, value)
    if node.nil?
      Node.new(key, value)
    elsif node.key == key
      node.value = value
      node
    elsif key < node.key
      node.left = put(node.left, key, value)
      node
    else
      node.right = put(node.right, key, value)
      node
    end
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
      del_min(node.right)
    end
  end


  def keys

  end

end


class Node
  attr_accessor :key, :value, :right, :left
  def initialize(key, val)
    @left = nil
    @right = nil
    @key = key
    @value = val
  end

end
