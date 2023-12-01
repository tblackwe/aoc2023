# frozen_string_literal: true

# Day01 of AoC 2023
class Day01
  number_map = { 'zero' => 0,
                 'one' => 1,
                 'two' => 2,
                 'three' => 3,
                 'four' => 4,
                 'five' => 5,
                 'six' => 6,
                 'seven' => 7,
                 'eight' => 8,
                 'nine' => 9 }
  input = File.readlines('./lib/day01/input')

  sum = 0
  input.each do |row|
    first_num_string = row[/\d|zero|one|two|three|four|five|six|seven|eight|nine/]
    first_num = number_map[first_num_string] || first_num_string.to_i
    first_num *= 10
    reverse_row = row.reverse
    second_num_string = reverse_row[/\d|orez|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin/]
    second_num = number_map[second_num_string.reverse] || second_num_string.to_i
    sum += first_num + second_num
  end
  puts sum
end
