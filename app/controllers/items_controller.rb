class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    # @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :condition_id, :shipping_charge_id, :prefecture_id, :day_ship_id, :image, :text, :name, :price).merge(user_id: current_user.id)
  end
  
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
