class Node
  attr_accessor :value, :next_node

  def initialize(value=nil, next_node=nil)
    @value = value
    @next_node = next_node # pointer for next value, must be set to nil upon creation of new node
  end
end