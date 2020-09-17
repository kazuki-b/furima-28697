class PurchasesController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
  end

  def create
  end


end
