#!/usr/bin/env ruby

require "set"

ROW_SIZE = 4

grid = [
  0, 0, 0, 0,
  0, 0, 1, 0,
  0, 1, 0, 0
]

def is_finish(index, grid)
  index == grid.size - 1
end

def get_path(grid)
  get_path_r 0, grid
end

def get_path_r(current, grid)
  puts "current #{current}"

  return current.to_s if is_finish(current, grid)

  down_index = current + ROW_SIZE
  right_index = current + 1

  can_go_down = (grid.size / ROW_SIZE).floor > (down_index / ROW_SIZE).floor && grid[down_index] == 0
  can_go_right = current != ROW_SIZE - 1 && grid[right_index] == 0

  if can_go_down
    down = get_path_r(down_index, grid)

    if down != nil
      return current.to_s + "," + down.to_s
    end
  end

  if can_go_right
    down = get_path_r(right_index, grid)

    if down != nil
      return current.to_s + "," + down.to_s
    end
  end

end

output = get_path grid
puts output