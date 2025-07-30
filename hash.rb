require_relative 'linked'

class HashMap < LinkedList
  attr_accessor :load, :cap, :list, :buckets

  def initialize
    @load = 0.75
    @cap = 16
    @buckets = Array.new((cap * load).floor)
  end

  def hash(key) # returns a unique key based on the str's ords
    hash_code = 0
    prime_num = 31
    key.each_char {|char| hash_code = prime_num * hash_code + char.ord}
    hash_code
  end

  def set(key, value) # sets our key and value into the array
    prime_num = 11
    index = hash(key) % prime_num
    if @buckets[index].nil?
      @buckets[index] = LinkedList.new
    end
    @buckets[index].append(key, value)
  end

  def get(key) # takes one argument as a key and returns the value that is assigned to this key. If key is not found, return nil.
    prime_num = 11
    index = hash(key) % prime_num
    list = @buckets[index]
    current_node = list.head

    until current_node.nil?
      return puts "The value '#{current_node.value}' is assigned to the key '#{key}'" if current_node.key == key
      current_node = current_node.next_node
    end
    puts "The key that was inputted does not exist"
  end



  def buck
    puts @buckets
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
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

# test.buck
test.get('golden')