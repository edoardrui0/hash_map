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
    @buckets[index] = LinkedList.new if @buckets[index].nil?
    @buckets[index].append_or_update(key, value)
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

  def has?(key) # takes a key as an argument and returns true or false based on whether or not the key is in the hash map.
    prime_num = 11
    index = hash(key) % prime_num
    list = @buckets[index]
    return false if @buckets[index].nil? # guard clause
    current_node = list.head

    until current_node.nil? # can also be written `while current_node`
      return true if current_node.key == key
      current_node = current_node.next_node
    end
    false
  end

  def remove(key) # remove key and return the deleted key's value if key is found in hash map. else, return nil
    prime_num = 11
    index = hash(key) % prime_num
    list = @buckets[index]
    return nil if @buckets[index].nil? # guard clause
    current_node = list.head

    while current_node
      puts "You deleted the key '#{key}'. It's value was '#{current_node.value}'" if current_node.key == key
      list.delete(key) if current_node.key == key
      current_node = current_node.next_node
    end
    nil
  end

  def length # returns the number of stored keys in the hash map.
    length = 0
    @buckets.map do |i|
      next if i.nil? # guard clause if index is empty
      current_node = i.head
      until current_node.nil?
        length += 1 if current_node.key
        current_node = current_node.next_node
      end
    end
    puts "There are #{length} keys in this HashMap"
  end

  def clear # removes all entries in the hash map.
    @buckets.clear
  end

  def keys # returns an array containing all the keys inside the hash map.
   arr = []
   @buckets.map do |i|
     next if i.nil? # guard clause if index is empty
     current_node = i.head
     until current_node.nil?
       arr << current_node.key if current_node.key
       current_node = current_node.next_node
     end
   end
   p arr
  end

  def values # returns an array containing all the values.
    arr = []
    @buckets.map do |i|
      next if i.nil? # guard clause if index is empty
      current_node = i.head
      until current_node.nil?
        arr << current_node.value if current_node.value
        current_node = current_node.next_node
      end
    end
    p arr
  end

  def entries # returns an array that contains each key, value pair. Example: [[first_key, first_value], [second_key, second_value]]
    entries = []
    @buckets.map do |i|
      next if i.nil?
      current_node = i.head
      until current_node.nil?
        entries << [current_node.key, current_node.value]
        current_node = current_node.next_node
      end
    end
    p entries
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
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
test.set('frog', 'green')
test.set('carrot', 'orange')
test.set('carrot', 'red')
test.set('grape', 'green')

test.entries
test.length