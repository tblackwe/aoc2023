# frozen_string_literal: false

# Day04 of AoC 2023
class Day04
  input = File.readlines('./lib/day04/input')
  games = {}
  input.each do |line|
    line = line.split(':')
    key = line.first
    tuple = line.last.strip.split('|')
    possible_winning_nums = tuple.first.split
    candidates = tuple.last.split
    winning_nums = possible_winning_nums & candidates
    bin_value = '0'
    unless winning_nums.empty?
      bin_value = '1'
      (1..winning_nums.size - 1).each do |_index|
        bin_value += '0'
      end
    end
    games[key] =
      { 'possible_winning_nums' => possible_winning_nums, 'candidates' => candidates, 'winning_nums' => winning_nums,
        'score' => bin_value.to_i(2) }
  end
  score = 0
  games.each_value do |value|
    score += value['score']
  end
  puts score
end
