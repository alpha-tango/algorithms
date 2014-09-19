
def binary_search(sorted_array, x)
 p = 0
 n = sorted_array.length
 r = n

 while p <= r
   q = (p + r)/2

   if sorted_array[q] == x
     return q
   elsif sorted_array[q] > x
     r = q - 1
   else
     p = q + 1
   end
 end
 "not found"
end

#runtime is between Theta(1) and Theta (lg(n))

def recursive_binary_search(sorted_array, x)
  n = sorted_array.length
  if sorted_array[n/2] == x
    return n/2
  elsif sorted_array [n/2]  > x
    return recursive_binary_search(sorted_array[0..(n/2 - 1)], x)
  else
    return recursive_binary_search(sorted_array[(n/2 + 1)..n], x)
  end
end
