class Cart
  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def self.build_from_hash(hash)
    if hash.nil?
      cart_items = []
    else
      cart_items = hash["cart"]["items"].map do |item|
        CartItem.new(item["product_id"], item["quantity"])
      end
    end

    Cart.new(cart_items)
  end

  def serialize
    items = @items.map { |t|
      {"product_id" => t.product_id, "quantity" => t.quantity}
    }

    {"cart" => {"items" => items}}
  end

  def add_item(product_id)
    item = @items.find { |t| t.product_id == product_id }
    if item
      item.increment
    else
      @items << CartItem.new(product_id)
    end
  end

  def empty?
    @items.empty?
  end
end
