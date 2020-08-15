class OrdersController < ApplicationController

  def index
  end
  

  def create
    
    @order = OrderAddress.new(order_params)
    
    if @order.valid?
      @order.save  # バリデーションをクリアした時
      return redirect_to root_path
    else
      render :index    # バリデーションに弾かれた時
    end
  end

  private

  def order_params
    params.permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number,:item_id).merge(user_id: current_user.id)
  end
end
