class AddOrderIdToOrderitems < ActiveRecord::Migration
  def change
    add_column :order_items, :order_id, :integer, index: true
    add_column :order_items, :product_id, :integer, index: true
    add_column :order_items, :quantity, :integer, default: 1
  end
end
