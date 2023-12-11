# frozen_string_literal: false

# Day08 of AoC 2023
class Day08
  input = File.readlines('./lib/day08/input')

  instructions = input.first.strip.chars
  map = {}
  input[2..].each do |line|
    map[line[0..2]] = { 'L' => line[7..9], 'R' => line[12..14] }
  end
  current_location = map['AAA']
  destination = map['ZZZ']
  steps = 0
  while current_location != destination
    instructions.each do |instruction|
      break if current_location == destination

      steps += 1
      current_location = map[current_location[instruction]]
    end
  end
  puts steps
end
