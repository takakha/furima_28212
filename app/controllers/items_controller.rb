class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:destroy, :show, :edit, :update]
  def index
    @items = Item.all.order('created_at DESC')
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

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def show
    @user = @item.user
    @orders = Order.all
  end

  def edit
    # 出品者以外はURLを直接入力して編集ページに遷移しようとすると、トップページに遷移する
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
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

  def set_item
    @item = Item.find(params[:id])
  end
end
