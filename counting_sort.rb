require 'pry'

a = [1, 2, 1, 2, 1, 2, 2, 1, 1, 1]

def really_simple_sort(unsorted_array)
  n = unsorted_array.length
  k = -1
  i = 0
  while i < n
   if unsorted_array[i] == 1
     k += 1
   end
   i += 1
 end

  i = 0
  while i <= k
    unsorted_array[i] = 1
    i += 1
  end

  i = k + 1
  while i < n
    unsorted_array[i] = 2
    i += 1
  end

  unsorted_array
end
