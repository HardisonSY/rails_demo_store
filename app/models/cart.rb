class Cart
  attr_reader :items
  def initialize
    @items = []
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
