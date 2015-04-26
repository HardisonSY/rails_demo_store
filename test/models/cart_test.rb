require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "cart should be able to add something" do
    cart = Cart.new
    cart.add_item(1)

    assert_equal false, cart.empty?
  end

  test "add more same products to cart" do
    cart = Cart.new
    3.times do
      cart.add_item(1)
    end
    5.times do
      cart.add_item(100)
    end

    assert_equal 2, cart.items.length
    assert_equal 3, cart.items.first.quantity
    assert_equal 5, cart.items.second.quantity
  end
end
