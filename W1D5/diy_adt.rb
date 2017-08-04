class Stack

  def initialize
    @container = []
  end

  def add(el)
    @container << el
    el
  end

  def remove
    @container.pop
  end

  def show
    p @container.dup
  end
end

class Queue

  def initialize
    @container = []
  end

  def enqueue(el)
    @container << el
    el
  end

  def dequeue
    @container.shift
  end

  def show
    p @container.dup
  end
end

class Map

  def initialize
    @container = []
  end

  def assign(key, value)
    if all_keys.include?(key)
      @container[lookup(key)] = [key, value]
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

  def show
    p @container.dup
  end
end
