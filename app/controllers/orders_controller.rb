class OrdersController < ApplicationController
  before_action :initialize_cart

  def create
    render text: params
  end
end
