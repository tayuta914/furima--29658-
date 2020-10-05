class OrdersController < ApplicationController
  before_action :set_order,only: [:index, :create]
  
  def index
    if user redirect_to new_user_session_path unless user_signed_in?
    @order = Order.new
  end

  def create
    @order = UserPurchase.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price,
    card: order_params[:token],
    currency: 'jpy'
   )
  end

 
  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :telephone, :token, :item_id).merge(user_id: current_user.id)
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

end



