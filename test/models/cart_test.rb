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

  test "get item from cart" do
    p1 = Product.create(name:'ruby book')

    cart = Cart.new
    cart.add_item(p1.id)

    assert_kind_of Product, cart.items.first.product
  end

  test "cart can serialize to hash" do
    cart = Cart.new
    cart.add_item(1)
    cart.add_item(1)
    cart.add_item(2)

    assert_equal session_hash, cart.serialize
  end

  test "build cart from hash" do
    cart = Cart.build_from_hash(session_hash)

    assert_equal 1, cart.items.first.product_id
    assert_equal 2, cart.items.first.quantity
    assert_equal 2, cart.items.second.product_id
    assert_equal 1, cart.items.second.quantity
  end

  private
  def session_hash
    {
      "cart" => {
        "items" => [
          {"product_id" => 1, "quantity" => 2},
          {"product_id" => 2, "quantity" => 1}
        ]
      }
    }
  end
end
