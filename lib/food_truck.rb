# frozen_string_literal: true

# Food Truck Class
class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    @inventory[item] || 0
  end

  def stock(item, amount)
    if @inventory[item]
      @inventory[item] += amount
    else
      @inventory[item] = amount
    end
  end

  def potential_revenue
    @inventory.sum do |item, amount|
      (item.price.tr('^0-9, .', '').to_f * amount).round(2)
    end
  end
end
