# frozen_string_literal: false

# Day11 of AoC 2023
class Day11
  input = File.readlines('./lib/day11/test_input').map(&:chomp)

  place_holder = []
  input.each do |line|
    split_line = line.split('')
    place_holder << split_line
    place_holder << split_line if split_line.count('#').zero?
  end
  place_holder = place_holder.transpose.map(&:reverse)
  galaxy_map = []
  place_holder.each do |line|
    galaxy_map << line
    galaxy_map << line if line.count('#').zero?
  end

  galaxy_coords = []
  galaxy_map.each_with_index do |row, row_index|
    row.each_with_index do |column, column_index|
      galaxy_coords << [column_index, row_index] if column == '#'
    end
  end

  pairs = []
  until galaxy_coords.empty?
    p1 = galaxy_coords.pop
    galaxy_coords.each { |coord| pairs << [p1, coord] }
  end

  sum = 0
  pairs.each do |pair|
    sum += (pair[0][0] - pair[1][0]).abs + (pair[0][1] - pair[1][1]).abs
  end
  pp sum
end
