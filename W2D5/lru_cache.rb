class LRUCache
  def initialize(cache_size)
    @cache_size = cache_size
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el)
    if @cache.include?(el)
      remove_oldest_of_el(el)
      @cache << el
    elsif count >= @cache_size
      @cache.shift
      @cache << el
    else
      @cache << el
    end
  end

  def show
    p @cache
  end

  private

  def remove_oldest_of_el(el)
    @cache.delete(el)
  end
end



johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.show

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.show
