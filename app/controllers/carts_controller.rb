class CartsController < ApplicationController
  before_action :initialize_cart

  def add
    product = Product.find_by(id: params[:id])
    if product
      @cart.add_item(product.id)
      session[:cart] = @cart.serialize
      redirect_to :back, notice: "#{product.name} 已成功加入購物車"
    else
      redirect_to :back, notice: "無此商品"
    end
  end

  def show
  end

  def checkout
    @order = Order.new
    @token = Braintree::ClientToken.generate
  end

end
