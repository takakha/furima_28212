class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
    @orders = Order.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
    @orders = Order.all
  end

  def edit
    @item = Item.find(params[:id])
    #購入者はURLを直接入力して編集ページに遷移しようとすると、トップページに遷移する
    unless current_user.id == @item.user_id
    redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private

  def item_params
    params.require(:item).permit(:item, :image, :text, :price, :category_id, :status_id, :delivery_fee_id, :area_id, :day_id).merge(user_id: current_user.id)
  end
end
