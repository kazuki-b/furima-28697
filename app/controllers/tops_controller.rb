class TopsController < ApplicationController
  def index
    @item = Item.all.order(id: "DESC")
  end
end
