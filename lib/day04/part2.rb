# frozen_string_literal: false

# Day04 of AoC 2023
class Day04
  input = File.readlines('./lib/day04/input')
  games = {}
  input.each do |line|
    line = line.split(':')
    key = line.first.gsub(/\s+/, '')
    tuple = line.last.strip.split('|')
    possible_winning_nums = tuple.first.split
    candidates = tuple.last.split
    winning_nums = possible_winning_nums & candidates
    games[key] =
      { 'possible_winning_nums' => possible_winning_nums, 'candidates' => candidates, 'winning_nums' => winning_nums,
        'num_of_cards' => 1 }
  end
  games['Card1']['num_of_cards'] = 1

  card_counter = 1
  total_scratchers = 0
  games.each_value do |value|
    card_counter += 1
    (1..value['num_of_cards']).each do |_i|
      (0..(value['winning_nums'].size - 1)).each do |j|
        games["Card#{card_counter + j}"]['num_of_cards'] += 1
      end
    end
    total_scratchers += value['num_of_cards']
  end
  puts total_scratchers
end
