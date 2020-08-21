class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root

  def index
    @order = OrderAddress.new
    @item = Item.find(params[:item_id])
    # URLを直接入力して購入済みの商品ページへ遷移しようとすると、トップページに遷移する
    redirect_to root_path unless @item.order.nil?
  end

  def create
    @order = OrderAddress.new(postcode: order_params[:postcode], prefecture_id: order_params[:prefecture_id],
                              city: order_params[:city], block: order_params[:block], building: order_params[:building], phone_number: order_params[:phone_number],
                              item_id: order_params[:item_id], user_id: order_params[:user_id])
    if @order.valid?
      pay_item
      @order.save # バリデーションをクリアした時
      redirect_to root_path
    else
      render :index # バリデーションに弾かれた時
    end
  end

  private

  def order_params
    params.permit(:token, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵(環境変数)
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類
    )
  end

  # 出品者はURLを直接入力して購入ページに遷移しようとすると、トップページに遷移する
  def move_to_root
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end
end
