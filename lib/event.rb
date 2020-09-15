# frozen_string_literal: true

# Event class
class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map(&:name)
  end

  def food_trucks_that_sell(item)
    @food_trucks.select { |truck| truck.inventory.keys.include?(item) }
  end

  def items
    inventories = @food_trucks.map(&:inventory)

    inventories.each_with_object({}) do |inventory, output|
      inventory.each do |item, amount|
        if output[item]
          output[item] += amount
        else
          output[item] = amount
        end
      end
    end
  end

  def total_inventory
    items.each_with_object({}) do |item, output|
      output[item[0]] = {
        quantity: item[1],
        food_trucks: food_trucks_that_sell(item[0])
      }
    end
  end

  def overstocked_items
    total_inventory.each_with_object([]) do |item, output|
      output << item[0] if item[1][:quantity] > 50 && item[1][:food_trucks].length > 1
    end
  end
end
