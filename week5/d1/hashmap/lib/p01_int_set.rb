class MaxIntSet
  attr_reader :store

  def initialize(max)
    #@max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    if num >= @store.length || num < 0
      raise "Out of bounds" 
    else
      @store[num] = true
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    return @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :num_buckets, :store
  
  def initialize(num_buckets = 20)
    @num_buckets = num_buckets
    @store = Array.new(num_buckets) { Array.new }

  end

  def insert(num)
    store_idx = num % @num_buckets 
    @store[store_idx] << num
  end

  def remove(num)
    if include?(num) 
      store_idx = num % num_buckets
      @store[store_idx].delete(num)
    end

  end

  def include?(num)
    store_idx = num % num_buckets
    @store[store_idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
