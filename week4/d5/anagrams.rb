# def anagrams(array)
#   return [array] if array.length <= 1

#   first = array.shift

#   perms = anagrams(array)
#   total = []

#   perms.each do |perm|
#     (0..perm.length).each do |i|
#       total << perm[0 ... i] + [first] + perm[i .. -1]
#     end
#   end
#   total
# end

# def first_anagrams(str_1, str_2)
#   string_1 = str_1.split('')
#   string_2 = str_2.split('')

#   anagrams(string_1).include?(string_2)
# end

def first_anagrams_2(str_1, str_2)
  string_1 = str_1.split('')
  string_2 = str_2.split('')

  return false if str_1.length != str_2.length

  string_1.each do |char|
    idx = string_2.find_index(char)
    if idx == nil
      return false
    else
      string_2.delete_at(idx)
    end
  end

  return true if string_2.empty?
end


p first_anagrams_2("gizmo", "sally")
