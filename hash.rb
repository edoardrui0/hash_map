class HashMap
  attr_accessor :load, :cap, :buckets

  def initialize
    @load = 0.75 
    @cap = 16
    @buckets = Array.new(cap)
  end

  def hash(key) # returns a unique key based on the str's ords
    hash_code = 0
    prime_num = 31
    key.each_char {|char| hash_code = prime_num * hash_code + char.ord}
    hash_code
  end

  def set(key, value)
    index = hash(key)
    buckets[0] = index, value
    p buckets
  end
end

test = HashMap.new

test.set('apple', 'red')