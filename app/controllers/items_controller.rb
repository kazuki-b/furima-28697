class ItemsController < ApplicationController
  # before_action :authenticate_user!

  def new
    @item = Item.new
    authenticate_user!
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name,:comment,:image,:price,:category_id,:status_id,:area_id,:postage_id,:ship_date_id).merge(user_id: current_user.id)
  end

end
