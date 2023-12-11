# frozen_string_literal: false

# Day08 of AoC 2023 DO NOT RUN, takes 197 days to resolve on my machine.
class Day08
  input = File.readlines('./lib/day08/input')

  instructions = input.first.strip.chars
  map = {}
  input[2..].each do |line|
    map[line[0..2]] = { 'L' => line[7..9], 'R' => line[12..14] }
  end
  start_locations = map.find_all { |entry| entry[0].end_with? 'A' }.map { |entry| entry[0] }
  final_destinations = map.find_all { |entry| entry[0].end_with? 'Z' }.map { |entry| entry[0] }

  iterations = []

  start_locations.each do |start_location|
    steps = 0
    current_location = start_location

    until final_destinations.include? current_location
      instructions.each do |instruction|
        break if final_destinations.include? current_location

        steps += 1
        current_location = map[current_location][instruction]
      end
    end
    iterations << steps
  end

  pp iterations.reduce(1, :lcm)
end
