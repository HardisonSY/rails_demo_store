class Backend::OrdersController < Backend::BaseController
  def index
    @orders = Order.all
  end
end
