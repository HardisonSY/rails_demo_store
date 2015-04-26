require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "cart should be able to add something" do
    cart = Cart.new
    cart.add_item(1)

    assert_equal false, cart.empty?
  end
end
