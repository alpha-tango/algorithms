require 'pry'
a = [12, 9 , 3, 7, 14, 11, 6, 2, 10, 5]

def selection_sort(unsorted_array)
  i = 0
  n = unsorted_array.length

  while i < n - 2
    smallest = i
    j = i + 1
    while j < n
      if unsorted_array[j] < unsorted_array[smallest]
        smallest = j
      end
      j+=1
    end
      swap = unsorted_array[i]
      unsorted_array[i] = unsorted_array[smallest]
      unsorted_array[smallest] = swap
      i = i+1
  end
  unsorted_array
end

#runtime is Theta(n**2)
#but might be reasonable to use if moving array elements is very time consuming
#(they're large or stored on a disk)

def insertion_sort(unsorted_array)
  i = 1
  n = unsorted_array.length

  while i < n
    key = unsorted_array[i]
    j = i - 1
    while j >= 0 && unsorted_array[j] > key
      unsorted_array[j+1] = unsorted_array[j]
      j -= 1
    end
    unsorted_array[j+1] = key
    i += 1
  end
  unsorted_array
end

#worst case running time is Theta(n**2)
#this algorithm has an advantage over selection_sort
#if the array is "almost sorted"
#but if you don't know anything about the array, selection_sort is better

def merge_sort(unsorted_array)
  p = 0
  r = unsorted_array.length - 1
  puts "start of method, array is #{unsorted_array}"

  if p >= r
    puts "return #{unsorted_array}"
    return unsorted_array
  else
    q = (p + r)/2
    puts "start of left recursion, using #{unsorted_array[p..q]}"
    left_array = merge_sort(unsorted_array[p..q])
    puts "start of right recursion, using #{unsorted_array[(q+1)..r]}"
    right_array = merge_sort(unsorted_array[(q+1)..r])
    puts "calling merge on #{unsorted_array}"
    sorted_array = merge(left_array, right_array)
  end
  puts "end of method, working array is #{sorted_array}"
  sorted_array

end

def merge(left_array, right_array)
  puts "left array is #{left_array}"
  puts "right array is #{right_array}"
  left_array<<10**10
  right_array<<10**10
  i = 0
  j = 0
  k = 0

  sorted_array = []
  while k < (left_array.length + right_array.length - 2)
    if left_array[i] <= right_array[j]
      sorted_array[k] = left_array[i]
      i+=1
    else
      sorted_array[k] = right_array[j]
      j+=1
    end
    k+=1
  end
  sorted_array
end

puts "#{merge_sort(a)}"

#merge sort has a higher runtime constant factor (significant for smaller arrays)
#must make complete copies of the entire input array - if space is a concern,
#don't use it.
#but, runtime is Theta(n*lg(n))

def quicksort(unsorted_array)
end

def partition(unsorted_array)
end
