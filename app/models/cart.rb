class Cart
  attr_reader :items

  def initialize
    @items = []
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
