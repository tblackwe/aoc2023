# frozen_string_literal: false

def determine_primary(hand) # rubocop:disable all
  hand_values = {
    five_of_a_kind: 7,
    four_of_a_kind: 6,
    full_house: 5,
    three_of_a_kind: 4,
    two_pair: 3,
    pair: 2,
    high_card: 1
  }
  split_hand = hand.chars
  j_count = split_hand.count('J')
  no_jokers_hand = split_hand.reject { |x| x == 'J' }
  uniq_cards = no_jokers_hand.uniq
  case uniq_cards.count
  when 0..1 # QQQQQ or QQQQJ or QQQJJ or QQJJJ or QJJJJ or JJJJJ
    hand_values[:five_of_a_kind]
  when 2 # QQQQT or QQQTJ or QQTJJ or QTJJJ
    if no_jokers_hand.count(uniq_cards[0]) + j_count == 4 || no_jokers_hand.count(uniq_cards[1]) + j_count == 4
      hand_values[:four_of_a_kind]
    else # QQQTT or QQTTT
      hand_values[:full_house]
    end
  when 3
    if hand.count(uniq_cards[0]) + j_count == 3 ||
       hand.count(uniq_cards[1]) + j_count == 3 ||
       hand.count(uniq_cards[2]) + j_count == 3
      # QQQT2 or QTTT2 or QT222 or QQJT2 or QTTJ2 or QT22J
      hand_values[:three_of_a_kind]
    else # QQT2
      hand_values[:two_pair]
    end
  when 4
    hand_values[:pair]
  else
    hand_values[:high_card]
  end
end

def determine_secondary(hand) # rubocop:disable all
  result = '0x'
  hand.chars.each do |card|
    result += case card
              when 'A'
                'e'
              when 'K'
                'd'
              when 'Q'
                'c'
              when 'J'
                '1'
              when 'T'
                'a'
              else
                card
              end
  end
  result
end

# Day07 of AoC 2023
class Day07
  input = File.readlines('./lib/day07/input')
  result = {}
  input.each do |line|
    hand = line.split[0]
    bid = line.split[1]
    result[hand] = { primary: determine_primary(hand), secondary: determine_secondary(hand), bid: bid.to_i }
  end
  result = result.sort_by { |_key, value| [value[:primary], value[:secondary]] }.to_h
  score = 0
  result.each_with_index do |hand, index|
    score += (index + 1) * hand[1][:bid]
  end
  puts score
end
