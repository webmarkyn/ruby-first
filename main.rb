# frozen_string_literal: true

def bubble_sort(arr)
  (0..arr.length - 1).each do |i|
    (1..(arr.length - 1) - i).each do |j|
      arr[j], arr[j - 1] = arr[j - 1], arr[j] if arr[j - 1] > arr[j]
    end
  end
  arr
end

def bubble_sort_by(arr)
  (0..arr.length - 1).each do |i|
    (1..(arr.length - 1) - i).each do |j|
      if block_given?
        arr[j], arr[j - 1] = arr[j - 1], arr[j] if yield(arr[j - 1], arr[j]).positive?
      elsif arr[j - 1] > arr[j]
        arr[j], arr[j - 1] = arr[j - 1], arr[j]
      else
        'No block given!'
      end
    end
  end
  arr
end

puts bubble_sort([3, 2, 1])
puts bubble_sort_by(%w[hi hello hey]) { |left, right| left.length - right.length }
