# frozen_string_literal: true

require 'minitest/autorun'

# Assuming all the functions are in the same file or required appropriately
# Add your function definitions here
def display_current_inventory(inventory_list)
  inventory_list.each do |key, value|
    puts "#{key}, quantity: #{value}"
  end
  # use #each to iterate through each item of the inventory_list (a hash)
  # use puts to output each list item "<key>, quantity: <value>" to console
end

def display_guess_order(guesses)
  guesses.each_with_index do |number, item|
    puts "Guess #{number + 1} is #{item}"
  end
  # use #each_with_index to iterate through each item of the guesses (an array)
  # use puts to output each list item "Guess #<number> is <item>" to console
  # hint: the number should start with 1
end

def find_absolute_values(numbers)
  numbers.map(&:abs)
  # use #map to iterate through each item of the numbers (an array)
  # return an array of absolute values of each number
end

def find_low_inventory(inventory_list)
  # use #select to iterate through each item of the inventory_list (a hash)
  inventory_list.select do |_item, count|
    count < 4
  end
  # return a hash of items with values less than 4
end

def find_word_lengths(word_list)
  word_list.each_with_object(Hash.new(0)) do |item, hash|
    hash[item] = item.length
  end
  # use #reduce to iterate through each item of the word_list (an array)
  # return a hash with each word as the key and its length as the value
  # hint: look at the documentation and review the reduce examples in basic enumerable lesson
end

class TestFunctions < Minitest::Test
  def test_display_current_inventory
    inventory = { apples: 10, oranges: 5, bananas: 8 }
    assert_output("apples, quantity: 10\noranges, quantity: 5\nbananas, quantity: 8\n") do
      display_current_inventory(inventory)
    end
  end

  def test_display_guess_order
    guesses = %w[apple orange banana]
    assert_output("Guess #1 is apple\nGuess #2 is orange\nGuess #3 is banana\n") do
      display_guess_order(guesses)
    end
  end

  def test_find_absolute_values
    numbers = [-10, 0, 5, -3]
    assert_equal [10, 0, 5, 3], find_absolute_values(numbers)
  end

  def test_find_low_inventory
    inventory = { apples: 10, oranges: 3, bananas: 2, grapes: 4 }
    expected = { oranges: 3, bananas: 2 }
    assert_equal expected, find_low_inventory(inventory)
  end

  def test_find_word_lengths
    words = %w[apple banana cherry]
    expected = { 'apple' => 5, 'banana' => 6, 'cherry' => 6 }
    assert_equal expected, find_word_lengths(words)
  end
end
