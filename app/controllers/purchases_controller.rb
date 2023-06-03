class PurchasesController < ApplicationController

  def index
    @order = Order.new
  end

end

