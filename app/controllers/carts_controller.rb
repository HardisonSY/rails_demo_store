class CartsController < ApplicationController
  before_action :initialize_cart

  def add
    product = Product.find_by(id: params[:id])
    if product
      @cart.add_item(product.id)
      session["cart"] = @cart.serialize
      redirect_to :back, notice: "成功加入商品：#{product.name}"
    else
      redirect_to :back, notice: '無此商品'
    end
  end

  def show
  end
end
