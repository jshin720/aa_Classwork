
def find_my_min(arr)
  arr.each do |ele1|
    return ele1 if arr.all? { |ele2| ele1 <= ele2 }
  end
end

# time complexity = n ^ 2


# def find_my_min(arr)
#   arr.inject do |acc, ele|  
#     if acc < ele
#       acc
#     else
#       ele
#     end
#   end
# end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p find_my_min(list)  # =>  -5

# time complexity = n 