class Cart
  attr_reader :items

  def self.build_from_hash(hash)

    if hash.nil?
      items = []
    else
      items = hash["cart"]["items"].map do |item|
        CartItem.new(item["product_id"], item["quantity"])
      end
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

  def total_price
    total = items.inject(0) { |sum, item| sum + item.price }
    if total >= 1000
      total = total - 100
    else
      total
    end
  end

end
