class Stack

  def initialize
    @container = []
  end

  def add(el)
    @container << el
  end

  def remove
    @container.pop
  end

  def show
    @container.dup
  end
end

class Queue

  def initialize
    @container = []
  end

  def enqueue(el)
    @container.unshift(el)
  end

  def dequeue
    @container.pop
  end

  def show
    @container.dup
  end
end

class Map

  def initialize
    @container = []
  end

  def assign(key, value)
    if all_keys.include?(key)
      @container[location] = [key,value]
    else
      @container << [key, value]
    end
  end

  def lookup(key)
    all_keys.index(key)
  end

  def remove(key)
    idx = lookup(key)
    @container.delete_at(idx)
  end

  def all_keys
    @container.map {|arr| arr[0] }.flatten
  end
end


a = Stack.new
b = Queue.new
c = Map.new


puts a.add(2)
puts a.add(3)
puts a.add(4)
puts a.add(5)
puts a.add(6)
