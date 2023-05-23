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
    params.require(:item).permit(:product_name, :description, :category, :condition, :price, :shipping_charge, :shipping_origin, :derivary, :image).merge(user_id: current_user.id)
  end

end
