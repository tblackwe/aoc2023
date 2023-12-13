# frozen_string_literal: false

# Day05 of AoC 2023
class Day05
  # Arrange
  pp "#{Time.now}: Arranging input "
  input = File.readlines('./lib/day05/input')
  seed_range = input.first[6..].strip.split.map(&:to_i)
  all_seeds = []
  location_map = {}
  current_key = ''
  seed_range.each_with_index do |_seed, index|
    next unless index.odd?

    all_seeds << (seed_range[index - 1]..(seed_range[index - 1] + seed_range[index] - 1))
  end
  answer = 3_911_192_867
  input[2..].each do |line|
    next if line.strip == ''

    if /(\w*) map:/.match(line)
      current_key = /(.*) map:/.match(line)[1]
      location_map[current_key] = { raw_data: [] }
      next
    end

    location_map[current_key][:raw_data] << line.strip.split.map(&:to_i)
  end

  def self.get_next(key, value, location_map)
    temp = location_map[key][:raw_data]
    ret_val = value
    temp.each do |range|
      next unless value.between?(range[1], range[1] + range[2])

      ret_val = range[0] - range[1] + value
      break
    end
    ret_val
  end

  all_seeds.each do |seeds|
    pp "#{Time.now}: Iterating over seeds #{seeds}"
    seeds.each_with_index do |seed, index|
      pp "#{Time.now}: heartbeat #{seeds}" if (index % 10_000_000).zero?
      current_value = get_next('seed-to-soil', seed, location_map)
      current_value = get_next('soil-to-fertilizer', current_value, location_map)
      current_value = get_next('fertilizer-to-water', current_value, location_map)
      current_value = get_next('water-to-light', current_value, location_map)
      current_value = get_next('light-to-temperature', current_value, location_map)
      current_value = get_next('temperature-to-humidity', current_value, location_map)
      current_value = get_next('humidity-to-location', current_value, location_map)
      answer = current_value if answer.nil? || current_value < answer
    end
  end

  pp "#{Time.now}: Answer is #{answer}"
end
