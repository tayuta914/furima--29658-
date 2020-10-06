class OrdersController  < ApplicationController
  before_action :set_order,only: [:index, :create]
  before_action :move_to_index, except: [:index]
  before_action :authenticate_user!,only: [:index, :create, :show]
  
  def index
    redirect_to root_path if current_user.id == @item.user_id || @item.order != nil
    @order =  UserPurchase.new

  end

  def create
    @order = UserPurchase.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'new'
    end
  end

  def show
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

  def move_to_index
    unless user_signed_in? 
      redirect_to action: :index
    end
  end

end



