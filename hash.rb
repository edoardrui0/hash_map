require_relative 'linked'

class HashMap
  attr_accessor :load, :cap, :buckets

  def initialize
    @load = 0.75 
    @cap = 16
    @buckets = Array.new(cap) {LinkedList.new()} # this is what we're stuck on, we need to figure out how to include LinkedList into our HashMap
  end

  def hash(key) # returns a unique key based on the str's ords
    hash_code = 0
    prime_num = 31
    key.each_char {|char| hash_code = prime_num * hash_code + char.ord}
    hash_code
  end

  def set(key, value)
    index = hash(key) % cap
    buckets[0] = index, value
    puts buckets
  end
end

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')