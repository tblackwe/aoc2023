# frozen_string_literal: false

# Day09 of AoC 2023
class Day09
  input = File.readlines('./lib/day09/input').map(&:chomp)

  values = []

  input.each do |line|
    extrapolated = [line.split.map(&:to_i)]
    extrapolated << extrapolated.last.each_cons(2).map { |a, b| b - a } until extrapolated.last&.all?(&:zero?)
    to_add = extrapolated.pop.last + (to_add || 0) until extrapolated.size == 1
    values << extrapolated.last.last + to_add
  end
  pp values.sum
end
