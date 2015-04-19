class Cart
  attr_reader :items

  def self.build_from_hash(hash)

    if hash['cart']
      items = hash["cart"]["items"].map do |item|
        CartItem.new(item["product_id"], item["quantity"])
      end
    else
      items = []
    end

    Cart.new(items)
  end

  def initialize(items = [])
    @items = items
  end

  def add_item(product_id)
    item = @items.find { |item| item.product_id == product_id }

    if item
      item.increment
    else
      @items << CartItem.new(product_id)
    end
  end

  def empty?
    @items.empty?
  end

  def serialize
    items = @items.map do |item|
      {"product_id" => item.product_id, "quantity" => item.quantity}
    end

    {
      "cart" => {
        "items" => items
      }
    }
  end

end
