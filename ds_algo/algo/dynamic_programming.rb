#!/usr/bin/env ruby

one = "fish"
two = "hish"

def longest_common_substring(a, b)
  grid = Array.new(a.size, Array.new(b.size, 0))

  a.each_with_index do |a_letter, i|
    b.each_with_index do |b_letter, j|
      grid[i][j] = if a_letter == b_letter
        if i != 0 && j != 0
          grid[i - 1][j - i] + 1
        else
          1
        end
      else
        0
      end
    end
  end

  row = grid.max { |a, b| a.max <=> b.max }
  end_index = row.index { |elem| elem == row.max }
  
  start_index = end_index - grid[end_index][end_index]

  a.slice(start_index, grid[end_index][end_index] + 1).join("")
end

puts longest_common_substring(one.chars, two.chars)

