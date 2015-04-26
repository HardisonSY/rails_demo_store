class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :product_id, index: true
      t.integer :order_id, index: true
      t.integer :quantity, default: 1

      t.timestamps null: false
    end
  end
end
