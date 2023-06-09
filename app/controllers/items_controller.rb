class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :prevent, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    return if user_signed_in? && current_user == @item.user

    redirect_to action: :index
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if user_signed_in? && current_user == @item.user
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :condition_id, :price, :shipping_charge_id,
                                 :shipping_origin_id, :derivary_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def prevent
    return unless @item.user_id != current_user.id || !@item.purchase.nil?

    redirect_to root_path
  end
end
