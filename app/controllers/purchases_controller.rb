class PurchasesController < ApplicationController

  def index
    @order = Order.new
  end

  end

  private

  def order_params
    params.require(:order).permit(:post_code, :shipping_origin_id, :address, :building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id]])
  end

end

