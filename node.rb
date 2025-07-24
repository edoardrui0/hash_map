class Node
  attr_accessor :key, :value, :next_node

  def initialize(key, value)
    @key = key
    @value = value
    @next_node = nil # pointer for next value, must be set to nil upon creation of new node
  end
end