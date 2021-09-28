require "byebug"

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
    if !include?(num)
      if @count >= num_buckets
        resize!
      end
      store_idx = num % num_buckets 
      @store[store_idx] << num
      @count += 1
    end
  end

  def remove(num)
    if include?(num) 
      store_idx = num % num_buckets
      @store[store_idx].delete(num)
      @count -= 1
   end
  end

  def include?(num)
    store_idx = num % num_buckets
    @store[store_idx].include?(num)
  end

  #private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    prev_buckets_num = num_buckets
    prev_store = @store.flatten
    new_store = Array.new(prev_buckets_num * 2){Array.new}
    prev_store.each do |ele|
      store_idx = ele % new_store.length 
      new_store[store_idx] << ele
    end
    @store = new_store
  end

end
