class ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items[7001..9500]
  end
end
