require_relative 'linked'

class HashMap < LinkedList
  attr_accessor :load, :cap, :list, :buckets

  def initialize
    @load = 0.75 
    @cap = 16
    @list = LinkedList.new
    @buckets = Array.new(cap) {@list} # this is what we're stuck on, we need to figure out how to include LinkedList into our HashMap
  end

  def hash(key) # returns a unique key based on the str's ords
    hash_code = 0
    prime_num = 31
    key.each_char {|char| hash_code = prime_num * hash_code + char.ord}
    hash_code
  end

  def set(key, value) # sets our key and value into the array
    prime_num = 17
    index = hash(key) % prime_num
    @buckets[index] = @list.append(key, value)
  end

  def buck
    p @buckets
  end
end

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')

test.buck