class Backend::OrdersController < Backend::BaseController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def pay
    @order = Order.find(params[:order_id])
    if @order.pay
      # sending email
      redirect_to :back, notice:'狀態變更成已付款'
    else
      redirect_to :back, alert:'狀態錯誤'
    end
  end

  def out
    @order = Order.find(params[:order_id])
    if @order.out
      # sending email
      redirect_to :back, notice:'狀態變更成已出貨'
    else
      redirect_to :back, alert:'狀態錯誤'
    end
  end

  def deliver
    @order = Order.find(params[:order_id])
    if @order.deliver
      # sending email
      redirect_to :back, notice:'狀態變更成已到貨'
    else
      redirect_to :back, alert:'狀態錯誤'
    end
  end
end
