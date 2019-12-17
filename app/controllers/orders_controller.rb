class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    # @order = Order.new(order_params)
    @order = current_user.orders.build(order_params) 

    current_cart.items.each do |item|
      @order.order_items.build(book: item.product,
                               quantity: item.quantity,
                               sell_price: item.product.sell_price)
    end

    if @order.save
      # 進入付款頁
      session['cart9527'] = nil
      redirect_to root_path, notice: '訂單已成功'
    else
      flash[:notice] = '發生錯誤!'
      render 'carts/checkout'
    end
  end

  private
  def order_params
    params.require(:order).permit(:recipient, :tel, :address, :note)
  end
end
