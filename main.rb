def bubble_sort(arr)
  for i in 0..arr.length-1
    for j in 1..(arr.length-1)-i
      if arr[j-1] > arr[j]
        arr[j], arr[j-1] = arr[j-1], arr[j]
      end
    end
  end
  arr
end

def bubble_sort_by(arr)
  for i in 0..arr.length-1
    for j in 1..(arr.length-1)-i
      if block_given?
        if yield(arr[j-1], arr[j]) > 0
          arr[j], arr[j-1] = arr[j-1], arr[j]
        end
      else
        if arr[j-1] > arr[j]
          arr[j], arr[j-1] = arr[j-1], arr[j]
        end
      end
    end
  end
  arr
end

# puts bubble_sort([3,2,1])
puts bubble_sort_by(["hi","hello","hey"]) { |left, right| left.length-right.length}