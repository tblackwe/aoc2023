# frozen_string_literal: false

# Day12 of AoC 2023
class Day12
  input = File.readlines('./lib/day15/input').map(&:chomp).first.split(',').map(&:chars)
  answer = 0

  def self.hash_algo(arr, current_value)
    return current_value if arr.empty?

    ch = arr.first
    current_value += ch.ord
    current_value *= 17
    current_value %= 256
    hash_algo(arr[1..], current_value)
  end

  input.each do |arr|
    answer += hash_algo(arr, 0)
  end
  pp answer
end
