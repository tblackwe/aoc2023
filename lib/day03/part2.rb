# frozen_string_literal: false

# Day03 of AoC 2023
class Day03
  input = File.readlines('./lib/day03/input')
  matrix = []
  input.each_with_index do |line, _index|
    matrix << line.strip.chars
  end

  symbol_coord = {}
  coord_list = []
  matrix.each_with_index do |row, index|
    row.each_index do |i|
      key = "#{index},#{i}" if row[i].match?(/\*/)
      unless key.nil?
        symbol_coord[key] = []
        coord_list << key
      end
    end
  end

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
      intersection = (coords_to_check & coord_list)
      intersection.each do |cp|
        symbol_coord[cp] << num
      end
      row[num_start] = 'X' # this is a hack. got a problem when same number is on the row twice
    end
  end
  answer = 0
  symbol_coord.each_value do |value|
    answer += value.first.to_i * value.last.to_i if value.size == 2
  end
  puts answer
end
