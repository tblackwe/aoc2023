# frozen_string_literal: false

# Day13 of AoC 2023
class Day13
  # Arrange
  maps = { 'map1' => [] }
  counter = 1
  input = File.readlines('./lib/day13/input2').map(&:chomp)
  input.each do |line|
    if line.strip.empty?
      counter += 1
      maps["map#{counter}"] = []
      next
    end
    maps["map#{counter}"] << line.strip.chars
  end

  def self.check_map(map)
    return true if map.empty?

    return check_map(map[1..-2]) if map.first == map.last

    false
  end

  def self.get_map_score(map, reflection_points) # rubocop:disable Metrics/CyclomaticComplexity,Metrics/AbcSize
    score = reflection_points.select { |rp| check_map(map[0..rp]) }.max
    score = (score + 1) / 2 unless score.nil?
    if score.nil?
      score = reflection_points.select { |rp| check_map(map[rp..]) }.max
      score = ((map.size - score) / 2) + score unless score.nil?
    end
    score || 0
  end

  def self.find_reflection_points(map)
    reflection_points = map.each_index.select { |i| map[0] == map[i] }
    reflection_points.concat(map.each_index.select { |i| map[map.size - 1] == map[i] })
    reflection_points
  end

  total_score = 0
  maps.each_value do |map|
    rps = find_reflection_points map
    score = 0
    score = 100 * get_map_score(map, rps[1..-2]) unless rps.empty?
    if score.zero?
      transposed_map = map.transpose.map(&:reverse)
      rps = find_reflection_points transposed_map
      score = get_map_score(transposed_map, rps[1..-2])
    end
    pp score
    total_score += score
  end
  pp total_score
end
