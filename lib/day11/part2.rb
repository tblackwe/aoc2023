# frozen_string_literal: false

# Day11 of AoC 2023
class Day11
  input = File.readlines('./lib/day11/input').map(&:chomp)

  place_holder = []
  empty_rows = []
  empty_columns = []
  input.each_with_index do |line, index|
    split_line = line.split('')
    place_holder << split_line
    empty_rows << index if split_line.count('#').zero?
  end
  place_holder = place_holder.transpose.map(&:reverse)
  galaxy_map = []
  place_holder.each_with_index do |line, index|
    galaxy_map << line
    empty_columns << index if line.count('#').zero?
  end
  galaxy_map = galaxy_map.transpose.map(&:reverse).transpose.map(&:reverse).transpose.map(&:reverse)

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
    temp_1 = [pair[0][0], pair[1][0]].sort
    distance_1 = (temp_1[0]..(temp_1[1] - 1)).map { |x| x }
    blanks1 = distance_1 & empty_columns
    distance_1 -= empty_columns
    temp_2 = [pair[0][1], pair[1][1]].sort
    distance_2 = (temp_2[0]..(temp_2[1] - 1)).map { |x| x }
    blanks2 = distance_2 & empty_rows
    distance_2 -= empty_rows

    sum += distance_1.size +
           distance_2.size +
           (blanks1.size * 1_000_000) +
           (blanks2.size * 1_000_000)
  end
  pp sum
end
