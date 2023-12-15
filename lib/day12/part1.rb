# frozen_string_literal: false

# Day12 of AoC 2023
class Day12
  input = File.readlines('./lib/day12/test_input').map(&:chomp)
  input.each do |line|
    split_line = line.split
    records = split_line[0].split('.')
    parts = split_line[1].split(',').map(&:to_i)
    candidates = {}
    until records.empty? && parts.empty?
      part = parts.pop

    end

    g1 = records.pop
    pp g1.size
    counter = 0
    pp records.first
    # while counter < g1.size
    #   parts.pop
    pp records
    pp parts
    
    break if true # rubocop:disable Lint/LiteralAsCondition
  end
end
