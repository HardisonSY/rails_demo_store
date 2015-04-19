class Order < ActiveRecord::Base
  has_many :order_items

  validates :name, presence: true
  validates :tel, presence: true
  validates :address, presence: true

  state_machine :initial => :pending do
    event :pay do
      transition :pending => :paid
    end

    event :out do
      transition :paid => :out
    end

    event :deliver do
      transition :out => :delivered
    end
  end

end
