
def find_my_min(arr)
  arr.each do |ele1|
    return ele1 if arr.all? { |ele2| ele1 <= ele2 }
  end
end

# time complexity = n ^ 2


def find_my_min2(arr)
  arr.inject do |acc, ele|  
    if acc < ele
      acc
    else
      ele
    end
  end
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p find_my_min(list)  # =>  -5

# time complexity = n 

def sub_sum(arr)
  subs = []
  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      subs << arr[i..j]
    end
  end

  max = 0
  subs.each do |sub|
    if max < sub.sum 
      max = sub.sum
    end
  end

  max
end

# time complexity = n^2  

def sub_sum2(arr)
  max = 0
  i = 0
  current = []

  while i < arr.length
    current << arr.shift
    if max < current.sum
      max = current.sum
    end
    i +=1 
  end
  max
end

# def sub_sum2(arr)
#   dupped = arr.dup
#   subs = [arr]
#   arr.each do |num|
#     subs << [num]
#     if dupped.length > 3
#       dupped.shift
#       dup2 = dupped.dup
#       subs.push(dupped)
#     end
#   end
  
#   max = subs.inject do |acc, ele|
#     if acc.sum > ele.sum
#       acc
#     else
#       ele
#     end
#   end
#   max.sum
# end

def sub_sum2(arr)
  max = arr[0]
  current_sum = 0

  arr.each do |ele|
    current_sum += ele
    if current_sum > max
      max = current_sum
    elsif current_sum < 0
      current_sum = 0
    end
  end
  max 
end

list = [5, 3, -7]
# list = [2, 3, -6, 7, -6, 7]
# list = [-5, -1, -3]

p sub_sum2(list) # => 8




