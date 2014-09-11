
def linear_search(some_array, x)
  n = some_array.length
  i = 0
  answer = "not found"

  while i != n
    if some_array[i] == x
      answer = i
    end
    i += 1
  end
  answer
end

#running time = Θ(n)

def better_linear_search (some_array, x)
  n = some_array.length
  i = 0

  while i != n
    if some_array[i] == x
      return i
    end
    i += 1
  end
  "not found"
end

#running time upper bound = Θ(n), lower bound = Θ(1)

def sentinel_linear_search(some_array, x)
  n = some_array.length
  last = some_array.pop
  some_array << x
  i = 0

  while some_array[i] != x
    i += 1
  end

  some_array.pop
  some_array << last

  if i < n || some_array[n] == x
    i
  else
    "not found"
  end
end

#might make more sense to check some_array[n] == x at the beginning...
#running time upper bound = Θ(n), lower bound = Θ(1)

def recursive_linear_search(some_array, x, i)
  n = some_array.length
  if i == n
    return "not found"
  end

  if some_array[i] == x
    return i
  else
    return recursive_linear_search(some_array, x, i+1)
end
