# frozen_string_literal: true

# Day01 of AoC 2023
class Day01
  input = File.readlines('./lib/day01/input')

  sum = 0
  input.each do |row|
    numbers = row.scan(/\d/)
    sum += (numbers.first.to_i * 10) + numbers.last.to_i
  end
  puts sum
end
