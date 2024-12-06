def bubble_sort(arr)
  i = 0
  while i < arr.length()
    j = i + 1
    while j < arr.length()
      if arr[j] < arr[i]
        temp = arr[i]
        arr[i] = arr[j]
        arr[j] = temp
      end
      j += 1
    end
    i += 1
  end
  p arr
end

bubble_sort([11, 13, 9, 8, 10, 2, 100, 42])