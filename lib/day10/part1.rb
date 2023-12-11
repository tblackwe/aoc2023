# frozen_string_literal: false

# Day10 of AoC 2023
class Day10
  input = File.readlines('./lib/day10/input').map(&:chomp)
  maze = input.map { |line| line.chars }

  go_right = { x: 1, y: 0 }
  go_left = { x: -1, y: 0 }
  go_up = { x: 0, y: -1 }
  go_down = { x: 0, y: 1 }

  directions = {
    '|' => { 'enter_top' => { 'next' => go_down, 'from' => 'enter_top' },
             'enter_bottom' => { 'next' => go_up, 'from' => 'enter_bottom' } },
    '-' => { 'enter_left' => { 'next' => go_right, 'from' => 'enter_left' },
             'enter_right' => { 'next' => go_left, 'from' => 'enter_right' } },
    'L' => { 'enter_top' => { 'next' => go_right, 'from' => 'enter_left' },
             'enter_right' => { 'next' => go_up, 'from' => 'enter_bottom' } },
    'J' => { 'enter_top' => { 'next' => go_left, 'from' => 'enter_right' },
             'enter_left' => { 'next' => go_up, 'from' => 'enter_bottom' } },
    '7' => { 'enter_bottom' => { 'next' => go_left, 'from' => 'enter_right' },
             'enter_left' => { 'next' => go_down, 'from' => 'enter_top' } },
    'F' => { 'enter_bottom' => { 'next' => go_right, 'from' => 'enter_left' },
             'enter_right' => { 'next' => go_down, 'from' => 'enter_top' } },
    '.' => {},
    'S' => {}
  }

  current_node = { x: 0, y: 0 }
  # find the starting point
  maze.each_with_index do |y, y_index|
    y.each_with_index { |x, x_index| current_node = { x: x_index, y: y_index } if x == 'S' }
  end
  end_node = current_node.clone

  from = ''
  if ['7', '|', 'F'].include? maze[current_node[:y] - 1][ current_node[:x]]
    current_node[:y] += -1
    from = 'enter_bottom'
  elsif  ['L', '|', 'J'].include? maze[current_node[:y] + 1][ current_node[:x]]
    current_node[:y] += 1
    from = 'enter_top'
  elsif ['L', '-', 'F'].include? maze[current_node[:y]][ current_node[:x] - 1]
    current_node[:x] += -1
    from = 'enter_left'
  else
    current_node[:x] += 1
    from = 'enter_right'
  end

  step_count = 0
  loop do
    step_count += 1
    current_instruction = maze[current_node[:y]][current_node[:x]]
    next_step = directions[current_instruction]
    current_node[:x] += next_step[from]['next'][:x]
    current_node[:y] += next_step[from]['next'][:y]
    from = next_step[from]['from']
    break if end_node == current_node
  end
  pp (step_count.to_f / 2).round
end
