# Method will take an array and recursively call itself to merge sort.

def merge_sort(array)
  return array if array.length == 1

  result = []
  break_point = array.length / 2 - 1
  first_half = merge_sort(array[0..break_point])
  second_half = merge_sort(array[break_point + 1..-1])

  until first_half.empty? && second_half.empty?
    result = push_least_element(result, first_half, second_half)
  end

  result
end

def push_least_element(result, first_array, second_array)
  if first_array.empty?
    result.push(second_array.slice!(0))
  elsif second_array.empty?
    result.push(first_array.slice!(0))
  elsif first_array[0] < second_array[0]
    result.push(first_array.slice!(0))
  elsif second_array[0] < first_array[0]
    result.push(second_array.slice!(0))
  end
end

def bubble_sort(array)
  arr = array
  passes = 0

  while passes < arr.length - 1 do
    i = 0
    swap_this_pass = false
    while i < arr.length - passes - 1 do
      if arr[i] > arr[i + 1]
        temp = arr[i + 1]
        arr[i + 1] = arr[i]
        arr[i] = temp
        swap_this_pass = true
      end
      i += 1
    end

    return arr if swap_this_pass == false

    passes += 1
  end
  arr
end

start_time = Time.now
merge_sort((1..10_000).to_a.shuffle)
end_time = Time.now
puts "Merge sort: #{end_time - start_time}"

start_time = Time.now
bubble_sort((1..10_000).to_a.shuffle)
end_time = Time.now
puts "Bubble sort: #{end_time - start_time}"
