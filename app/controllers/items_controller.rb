class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
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

  private
  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :condition_id, :price, :shipping_charge_id, :shipping_origin_id, :derivary_id, :image ).merge(user_id: current_user.id)
  end

end
