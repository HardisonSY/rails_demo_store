class OrdersController < ApplicationController

  before_action :initialize_cart

  def create
    @order = Order.new(order_params)
    #order_params["order_items"] = @cart.items.map
    #render text: order_params
    #return
    nonce = params[:payment_method_nonce]
    if @order.save
      Braintree::Transaction.sale(
        :amount => @cart.total_price,
        :payment_method_nonce => "nonce-from-the-client"
      )
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
