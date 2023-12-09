# frozen_string_literal: false

# Day05 of AoC 2023
class Day05
  input = File.readlines('./lib/day05/test_input')
  seeds_to_plant = input.first[6..].strip.split
  location_map = {}
  current_key = ''
  input[2..].each do |line|
    next if line.strip == ''

    if /(\w*) map:/.match(line)
      current_key = /(.*) map:/.match(line)[1]
      location_map[current_key] = { raw_data: [], arr: [] }
      next
    end

    location_map[current_key][:raw_data] << line.strip.split
    puts location_map[current_key].prev
    item = line.strip.split
    root_num = item[0].to_i
    start = item[1].to_i
    count = item[2].to_i
    place_holder = (0..count - 1).map { |i| i + root_num }
    location_map[current_key][:arr][start..(start + count - 1)] = place_holder
  end
  seeds_to_plant.each do |seed|
    seed_i = seed.to_i
    puts "Seed #{seed}, soil #{location_map['seed-to-soil'][:arr][seed_i]}, fertilizer #{location_map['seed-to-soil'][:arr][seed_i]}, water #{location_map['seed-to-soil'][:arr][seed_i]}, light #{location_map['seed-to-soil'][:arr][seed_i]}, temperature #{location_map['seed-to-soil'][:arr][seed_i]}, humidity #{location_map['seed-to-soil'][:arr][seed_i]}, location X"
  end
  # puts location_map
end
