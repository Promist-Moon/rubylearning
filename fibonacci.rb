def fibs(number)
  arr = [0, 1]
  def helper(array, dig)
    if dig == 0
      return array
    else
      array << array[-1] + array[-2]
      return helper(array, dig - 1)
    end
  end
  if number <= 2
    arr.take(number)
  else 
    helper(arr, number - 2)
  end
end

def fibs_rec(number)
  return [] if number <= 0
  return [0] if number == 1
  return [0, 1] if number == 2

  arr = fibs(number - 1)  
  arr << arr[-1] + arr[-2]
  arr
end

p fibs_rec(10)