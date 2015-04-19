require 'test_helper'

class CartItemTest < ActiveSupport::TestCase
  test "calculate money from cart item" do
    cart = Cart.new
    p1 = Product.create(name:'ruby book', price:10)
    5.times do
      cart.add_item(p1)
    end
    assert_equal 50, cart.items.first.price
  end

  test "special price calculation (滿千送百)" do
    cart = Cart.new
    p1 = Product.create(name:'ruby book', price:100)
      12.times do
      cart.add_item(p1)
    end
    assert_equal 1100, cart.total_price
  end
end
