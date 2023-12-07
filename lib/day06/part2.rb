# frozen_string_literal: false

# Day06 of AoC 2023
class Day06
  input = File.readlines('./lib/day06/input')
  time_i = input.first[10..].strip.gsub(/\s/, '').to_i
  distance_i = input.last[10..].strip.gsub(/\s/, '').to_i
  score = 0
  (0..time_i).each do |x|
    score += 1 if x * (time_i - x) > distance_i
  end
  puts score
end
