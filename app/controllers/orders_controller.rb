class OrdersController < ApplicationController

  before_action :initialize_cart

  def create
    @order = Order.new(order_params)
    @cart.items.each do |item|
      @order.order_items.build(product: item.product, quantity: item.quantity)
    end

    if @order.save
      # 進行交易
      Braintree::Transaction.sale(
        :amount => @cart.total_price,
        :payment_method_nonce => "nonce-from-the-client"
      )

      # 清除購物車
      session['cart'] = nil

      redirect_to root_path, notice:'感謝您!'
    else
      # TODO
    end
  end

  private
  def order_params
    params.require(:order).permit(:name, :tel, :address, :will_receive_email)
  end
end
