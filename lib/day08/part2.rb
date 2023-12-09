# frozen_string_literal: false

# Day08 of AoC 2023 DO NOT RUN, takes 197 days to resolve on my machine.
class Day08
  input = File.readlines('./lib/day08/input')

  instructions = input.first.strip.split('')
  map = {}
  input[2..].each do |line|
    map[line[0..2]] = { 'L' => line[7..9], 'R' => line[12..14] }
  end
  current_locations = map.find_all { |entry| entry[0].end_with? 'A' }.map { |entry| entry[0] }
  final_destinations = map.find_all { |entry| entry[0].end_with? 'Z' }.map { |entry| entry[0] }

  steps = 0
  continue = true
  while continue
    instructions.each do |instruction|
      steps += 1
      current_locations = current_locations.map do |current_location|
        map[current_location][instruction]
      end
      continue = !current_locations.all? { |candidate| final_destinations.include? candidate }
    end
  end
  puts steps
end
