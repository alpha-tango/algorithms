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
    left_array = merge_sort(unsorted_array[p..q])
    right_array = merge_sort(unsorted_array[(q+1)..r])
    sorted_array = merge(left_array, right_array)
  end
  sorted_array

end

def merge(left_array, right_array)
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

#merge sort has a higher runtime constant factor (significant for smaller arrays)
#must make complete copies of the entire input array - if space is a concern,
#don't use it.
#but, runtime is Theta(n*lg(n))

def quicksort(unsorted_array)
  p=0
  r=unsorted_array.length - 1

  if p>=r
    return unsorted_array
  else
    q = partition(unsorted_array)
    unsorted_array[p..(q-1)] = quicksort(unsorted_array[p..(q-1)])
    unsorted_array[(q+1)..r] = quicksort(unsorted_array[(q+1)..r])
  end
  unsorted_array
end

def partition(unsorted_array)
  p = 0
  r = unsorted_array.length - 1
  q = p
  u = p

  while u <= r - 1
    if unsorted_array[u] <= unsorted_array[r]
      swap = unsorted_array[q]
      unsorted_array[q] = unsorted_array[u]
      unsorted_array[u] = swap
      q += 1
    end
    u += 1
  end
  swap = unsorted_array[q]
  unsorted_array[q] = unsorted_array[r]
  unsorted_array[r] = swap
  q
end

#quicksort has runtime of Theta(n**2) at worst and Theta(n*lg(n)) at best
#(with better constant factors than merge sort)
#p 56 discusses optimizing to make partitions more even
#p 57 has a table of recaps best/worst times
#you can further optimize run times by hybridizing quicksort & insertion sort
#optimal crossover is at about 20 elements
#quicksort is fastest, but if you need to guard against worst-case behavior,
#choose mergesort
