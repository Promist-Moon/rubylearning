def merge_sort(arr)
  n = arr.length
  if n <= 1
    return arr
  else
    m = n/2
    first = merge_sort(arr[0..m-1])
    second = merge_sort(arr[m..n-1])

    def helper(arr1, arr2, final)
      if arr1.length == 0
        final.concat(arr2)
      elsif arr2.length == 0
        final.concat(arr1)
      elsif arr1[0] < arr2[0]
        final << arr1[0] 
        helper(arr1.drop(1), arr2, final)
      else
        final << arr2[0]
        helper(arr1, arr2.drop(1), final)
      end
      final
    end

    helper(first, second, [])
  end
end

p merge_sort([38, 27, 43, 10])