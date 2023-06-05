class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    if current_user == @item.user
      redirect_to root_path
    end
    if @item.purchase.presence && @item.user != current_user
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id]) 
    @order = Order.new(purchase_params)
    if @order.valid?
       @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end
  



  private

  def purchase_params
    params.require(:order).permit(:post_code, :shipping_origin_id, :mayor_ward_village,
     :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end

