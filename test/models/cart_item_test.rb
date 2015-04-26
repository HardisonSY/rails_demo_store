require 'test_helper'

class CartItemTest < ActiveSupport::TestCase
  test "calculate price of each item" do
    p1 = Product.create(name:'AAA', price:10)
    p2 = Product.create(name:'BBB', price:20)
    cart = Cart.new
    cart.add_item(p1.id)
    cart.add_item(p1.id)
    cart.add_item(p1.id)
    cart.add_item(p1.id)
    cart.add_item(p1.id)
    cart.add_item(p2.id)
    cart.add_item(p1.id)
    cart.add_item(p2.id)

    assert_equal 60, cart.items.first.price
    assert_equal 40, cart.items.second.price
  end
end
