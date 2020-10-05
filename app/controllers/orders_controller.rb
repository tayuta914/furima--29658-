class OrdersController < ApplicationController
  
  def index
    redirect_to new_user_session_path unless user_signed_in?
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
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

end



