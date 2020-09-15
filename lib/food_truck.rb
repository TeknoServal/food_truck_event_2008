# frozen_string_literal: true

# Food Truck Class
class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end
end
