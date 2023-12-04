# frozen_string_literal: false

# Day03 of AoC 2023
class Day03
  input = File.readlines('./lib/day03/input')
  matrix = []
  input.each_with_index do |line, _index|
    matrix << line.strip.split('')
  end

  symbol_coord = []

  matrix.each_with_index do |row, index|
    row.each_index do |i|
      symbol_coord << "#{index},#{i}" if row[i].match?(/\W/) && !row[i].match?(/\./)
    end
  end

  valid_part_nums = []

  input.each_with_index do |row, index|
    nums_on_line = row.split(/\W/).reject(&:empty?)
    nums_on_line.each do |num|
      num_start = row.index(/\b#{num}\b/)
      num_end = num_start + num.size
      rows_to_check = [index - 1, index, index + 1]
      columns_to_check = []
      ((num_start - 1)..num_end).each { |i| columns_to_check << i }
      coords_to_check = []
      rows_to_check.each { |row_i| columns_to_check.each { |col_i| coords_to_check << "#{row_i},#{col_i}" } }
      valid_part_nums << num.to_i unless (coords_to_check & symbol_coord).empty?
      row[num_start] = 'X' # this is a hack. got a problem when same number is on the row twice
    end
  end
  puts valid_part_nums.sum
end
