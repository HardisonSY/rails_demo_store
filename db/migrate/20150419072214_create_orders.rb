class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :tel
      t.string :address
      t.boolean :will_receive_email

      t.timestamps null: false
    end
  end
end
