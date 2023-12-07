# frozen_string_literal: false

# Day06 of AoC 2023
class Day06
  input = File.readlines('./lib/day06/input')
  times = input.first[10..].strip.split
  distances = input.last[10..].strip.split

  total_score = 1
  times.each_with_index do |time, index|
    score = 0
    time_i = time.to_i
    (0..time_i).each do |x|
      score += 1 if x * (time_i - x) > distances[index].to_i
    end
    total_score *= score
  end
  puts total_score
end
