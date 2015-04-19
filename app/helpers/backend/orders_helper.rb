module Backend::OrdersHelper
  def state_tag(order)

    case order.state
    when 'pending'
      content_tag :span, class:'text-danger' do
        "未處理"
      end
    when 'paid'
      content_tag :span, class:'text-info' do
        "已付款"
      end
    when 'out'
      content_tag :span, class:'text-success' do
        "已出貨"
      end
    when 'delivered'
        content_tag :span, class:'text-primary' do
        "已到貨"
      end
    end
  end
end
