#!/usr/bin/env ruby

def quicksort(array)
  if array.size < 2
    return array
  end

  pivot = array.shift

  gt = array.filter { |elem| elem >= pivot }
  lt = array.filter { |elem| elem < pivot }

  return [quicksort(lt), pivot, quicksort(gt)].flatten
end

unsorted = [88, 3, 9, 44, 73, 11, 42]

puts quicksort(unsorted)