# encoding: utf-8
require 'helper'

class TestFakerNameRu < Test::Unit::TestCase
  def setup
    @words = Faker::NameRU.name.split
  end
  
  def test_name
    assert [2,3].include?(@words.size)
    assert @words.each { |word| word.match /[А-Я][а-я]+/ }
  end
  
  def test_sex
    assert same_sex?(@words)
  end
  
  # checks if every name is of the same sex
  def same_sex?(words)
    [:male, :female].any? do |sex|
      words.all? do |word|
        [Faker::NameRU::LAST_NAMES, Faker::NameRU::FIRST_NAMES, Faker::NameRU::PATRONYMICS].any? do |names|
          names[sex].include?(word)
        end
      end
    end
  end
end