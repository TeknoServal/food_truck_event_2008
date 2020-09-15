require './lib/item'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/food_truck'

class FoodTruckTest < Minitest::Test
  def test_it_exists_with_attributes
    food_truck = FoodTruck.new('Rocky Mountain Pies')
    assert_instance_of FoodTruck, food_truck
    assert_equal 'Rocky Mountain Pies', food_truck.name
    expected = {}
    assert_equal expected, food_truck.inventory
  end
end
