
def selection_sort(unsorted_array)
  i = 0
  n = unsorted_array.length

  while i < n - 2
    smallest = i
    j = i + 1
    while j < n - 1
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
    while j > 0 && unsorted_array[j] > key
      unsorted_array[j+1] = unsorted_array[j]
      j -= 1
    end
    unsorted_array[j+1] = key
    i += 1
  end

  #worst case running time is Theta(n**2)
  #this algorithm has an advantage over selection_sort
  #if the array is "almost sorted"
  #but if you don't know anything about the array, selection_sort is better

end

def merge_sort(unsorted_array)
end

def quicksort(unsorted_array)
end

def partition(unsorted_array)
end
