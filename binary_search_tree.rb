# #----------------------------------------------------# #
# TODO: 0) documentation
#       1) #keys, #vals
#       2) auxilliary functions: rank(key),
#          select(nth el), floor(key), ceiling(key)...
# #----------------------------------------------------# #
class BinarySearchTree
  attr_accessor :root, :count
  def initialize
    @root = nil
    @count = 0
  end

  def insert(key, value)
    @root = put(@root, key, value)
  end

  def find(key)
    node = get(key)
    if node.nil?
      nil
    else
      node.value
    end
  end

  def delete(key)
    @root = remove(@root, key)
  end

  def del_min
    @root = remove_min(@root)
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

  def del_max
    @root = remove_max(@root)
  end

  def keys
    raise "Not implemented yet"
  end

  private
  def remove(node, key)
    return nil if node.nil?

    if key < node.key
      node.left = remove(node.left, key)
    elsif key > node.key
      node.right = remove(node.right, key)
    else
      return node.left if node.right.nil?
      return node.right if node.left.nil?

      node_copy = node
      node = min_node(node_copy.right)
      node.right = remove_min(node_copy.right)
      node.left  = node_copy.left
    end
    return node
  end

  def remove_max(node)
    return nil if node.nil?
    return node.left if node.right.nil?
    
    node.right = remove_max(node.right)
    return node
  end

  def remove_min(node)
    return nil if node.nil?
    return node.right if node.left.nil?
    node.left = remove_min(node.left)
    return node
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

  def put(node, key, value)
    if node.nil?
      @count += 1
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
