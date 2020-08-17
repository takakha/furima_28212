class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
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
    params.permit(:token, :postcode, :prefecture_id, :city, :block, :building, :phone_number,:item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_XXXXXXXX"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
    )
  end
end
