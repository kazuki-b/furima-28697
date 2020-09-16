class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:show]
  before_action :set_item only:[:show,:edit,:update,:dsetroy]

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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
    redirect_to root_path
    else
      render :show
  end

  private

  def item_params
    params.require(:item).permit(:name, :comment, :image, :price, :category_id, :status_id, :area_id, :postage_id, :ship_date_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
