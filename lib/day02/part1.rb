# frozen_string_literal: true

# Day02 of AoC 2023
class Day02
  input = File.readlines('./lib/day02/input')
  game_map = {}
  red_max = 12
  green_max = 13
  blue_max = 14
  input.each do |line|
    key = line.split(': ').first
    pulls = line.split(': ').last.split('; ')
    results = { valid: true, red: 0, green: 0, blue: 0, pulls: [] }
    pulls.each do |pull|
      result = { valid: true }
      pull.split(', ').each do |p|
        pair = p.split
        color = pair.last
        case color
        when 'red'
          results[:red] += pair.first.to_i
          results[:valid] = false if pair.first.to_i > red_max
        when 'blue'
          results[:blue] += pair.first.to_i
          results[:valid] = false if pair.first.to_i > blue_max
        when 'green'
          results[:green] += pair.first.to_i
          results[:valid] = false if pair.first.to_i > green_max
        end
        result.store(pair.last, pair.first)
      end
      results[:pulls] << result
    end
    game_map.store(key.split.last.to_i, results)
  end
  answer = 0
  game_map.each do |key, value|
    puts key, value
    answer += key if value[:valid]
  end
  puts answer
end
