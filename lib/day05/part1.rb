# frozen_string_literal: false

# Day05 of AoC 2023
class Day05
  # Arrange
  input = File.readlines('./lib/day05/input')
  location_map = { 'seeds' => { indicies: input.first[6..].strip.split.map(&:to_i) } }
  current_key = ''

  input[2..].each do |line|
    next if line.strip == ''

    if /(\w*) map:/.match(line)
      current_key = /(.*) map:/.match(line)[1]
      location_map[current_key] = { raw_data: [], indicies: [] }
      next
    end
    location_map[current_key][:raw_data] << line.strip.split.map(&:to_i)
  end

  # Act
  previous_key = 'seeds'
  %w[seed-to-soil soil-to-fertilizer fertilizer-to-water water-to-light light-to-temperature temperature-to-humidity
     humidity-to-location].each do |key|
    temp = location_map[key][:raw_data].reverse

    location_map[previous_key][:indicies].each do |index|
      ph = index
      temp.each do |range|
        next unless index.between?(range[1], range[1] + range[2])

        ph = range[0] - range[1] + index
      end
      previous_key = key
      location_map[key][:indicies] << ph
    end
  end

  # Answer
  pp location_map['humidity-to-location'][:indicies].min
end
