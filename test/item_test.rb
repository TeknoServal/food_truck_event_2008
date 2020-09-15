require './lib/item'
require 'minitest/autorun'
require 'minitest/pride'

class ItemTest < Minitest::Test
  def test_it_exists_with_attributes
    item = Item.new({ name: 'Apple Pie (Slice)', price: '$3.75' })

    assert_instance_of Item, item
    assert_equal item.name, 'Apple Pie (Slice)'
    assert_equal item.price, '$3.75'
  end
end
