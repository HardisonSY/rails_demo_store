class Order < ActiveRecord::Base
  has_many :order_items

  validates :name, presence: true
  validates :tel, presence: true
  validates :address, presence: true

end
