class ProductsController < ApplicationController

  before_action :initialize_cart

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

end
