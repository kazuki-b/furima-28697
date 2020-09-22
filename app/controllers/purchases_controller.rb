class PurchasesController < ApplicationController
  before_action :authenticate_user!, only:[:index,:new,:create]
  before_action :set_item, only:[:index,:new,:create]
  before_action :set_purchase, only:[:index,:new]

  def index
  end

  def new
  end

  def create
    @purchase = PurchaseDelivery.new(purchase_params)
    if  @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_delivery).permit(:postal_cord, :area_id, :city, :address, :building_name, :phone_number,:purchase_id
    ).merge(token: params[:token],user_id:current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_purchase
    @purchase = PurchaseDelivery.new
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency:'jpy'
    )
  end
end

