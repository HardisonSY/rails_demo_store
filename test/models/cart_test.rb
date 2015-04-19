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

  test "serialize from cart" do
    cart = Cart.new
    cart.add_item(1)
    cart.add_item(1)
    cart.add_item(2)

    assert_equal cart.serialize, session_hash
  end

  test "build from hash" do
    cart = Cart.build_from_hash(session_hash)

    assert_equal 1, cart.items.first.product_id
    assert_equal 2, cart.items.first.quantity
    assert_equal 2, cart.items[1].product_id
  end

  test "calc total price of cart" do
    cart = Cart.new
    p1 = Product.create(name:'ruby book', price:10)
    p2 = Product.create(name:'php book', price:20)

    cart.add_item(p1)
    cart.add_item(p1)
    cart.add_item(p1)
    cart.add_item(p2)
    cart.add_item(p2)

    assert_equal 70, cart.total_price
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
