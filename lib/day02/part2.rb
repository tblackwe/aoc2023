# frozen_string_literal: true

# Day02 of AoC 2023
class Day02
  input = File.readlines('./lib/day02/input')
  game_map = {}
  input.each do |line|
    key = line.split(': ').first
    pulls = line.split(': ').last.split('; ')
    results = { valid: true, red: 0, green: 0, blue: 0, power: 0, pulls: [] }
    pulls.each do |pull|
      result = { valid: true }
      pull.split(', ').each do |p|
        pair = p.split
        color = pair.last
        case color
        when 'red'
          results[:red] = pair.first.to_i if results[:red] < pair.first.to_i
        when 'blue'
          results[:blue] = pair.first.to_i if results[:blue] < pair.first.to_i
        when 'green'
          results[:green] = pair.first.to_i if results[:green] < pair.first.to_i
        end
        result.store(pair.last, pair.first)
      end
      results[:pulls] << result
    end
    results[:power] = results[:blue] * results[:green] * results[:red]
    game_map.store(key.split.last.to_i, results)
  end
  answer = 0
  game_map.each do |key, value|
    puts key, value
    answer += value[:power]
  end
  puts answer
end
