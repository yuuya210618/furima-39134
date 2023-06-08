class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    redirect_to root_path if current_user == @item.user
    return unless @item.purchase.presence && @item.user != current_user

    redirect_to root_path
  end

  def create
    @item = Item.find(params[:item_id])
    amount = @item.price
    @order = Order.new(purchase_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:order).permit(:post_code, :shipping_origin_id, :mayor_ward_village,
                                  :address, :building, :telephone_number)
          .merge(token: params[:token],
                 user_id: current_user.id,
                 item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: amount,  
      card: purchase_params[:token],    
      currency: 'jpy'                 
    )
  end
end
