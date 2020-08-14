class OrdersController < ApplicationController

  def index
  end
  

  def create
    @oder = Oder.create(order_params)
  end

  private

  def Oder_params
    params.require(:item).permit()
  end
end
