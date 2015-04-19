require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "add item to cart" do
    cart = Cart.new
    cart.add_item(1)

    assert_equal cart.empty?, false
  end

  test "add more same items to cart" do
    cart = Cart.new
    5.times do
      cart.add_item(1)
    end
    3.times do
      cart.add_item(2)
    end

    assert_equal 2, cart.items.length
    assert_equal 5, cart.items.first.quantity
    assert_equal 3, cart.items[1].quantity
  end

  test "get item from cart" do
    p1 = Product.create(name:'ruby book')

    cart = Cart.new
    cart.add_item(p1.id)
    cart.add_item(p1.id)
    cart.add_item(p1.id)

    assert_kind_of Product, cart.items.first.product
    assert_equal 3, cart.items.first.quantity
  end

end
