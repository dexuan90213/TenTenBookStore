class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  layout 'book'

  def index
    @orders = current_user.orders.order(id: :desc)
  end

  def create
    # @order = Order.new(order_params)
    @order = current_user.orders.build(order_params) 

    current_cart.items.each do |item|
      @order.order_items.build(book: item.product,
                               quantity: item.quantity,
                               sell_price: item.product.sell_price)
    end

    if @order.save
      # 清空購物車
      session['cart9527'] = nil
      # 進入付款頁
      redirect_to pay_order_path(@order.num), notice: '訂單已成功'
    else
      flash[:notice] = '發生錯誤!'
      render 'carts/checkout'
    end
  end

  def pay
  end

  def cancel
    order = current_user.orders.find_by(num: params[:id])
    order.cancel! if order.may_cancel?
    redirect_to orders_path, notice: "訂單 #{order.num} 已取消"
  end

  private
  def order_params
    params.require(:order).permit(:recipient, :tel, :address, :note)
  end
end
