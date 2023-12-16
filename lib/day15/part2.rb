# frozen_string_literal: false

# Day12 of AoC 2023
class Day12
  input = File.readlines('./lib/day15/input').map(&:chomp).first.split(',')
  boxes = []
  256.times { boxes << [] }

  def self.hash_algo(arr, current_value)
    return current_value if arr.empty?

    ch = arr.first
    current_value += ch.ord
    current_value *= 17
    current_value %= 256
    hash_algo(arr[1..], current_value)
  end

  input.each do |sequence|
    lens = sequence.split(/[=|-]/)
    box_index = hash_algo(lens[0].chars, 0)

    if sequence.include? '-'
      boxes[box_index].delete_if { |x| x[:label] == lens[0] }
    else
      index = boxes[box_index].index { |x| x[:label] == lens[0] }
      if index.nil?
        boxes[box_index].push({ label: lens[0], focal: lens[1].to_i })
      else
        boxes[box_index][index][:focal] = lens[1].to_i
      end
    end
  end

  answer = 0
  boxes.each_with_index do |box, box_index|
    box.each_with_index do |lens, lens_index|
      answer += (1 + box_index) * (1 + lens_index) * lens[:focal]
    end
  end

  pp answer
end
