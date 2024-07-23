class ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items[3001..4500]
  end
end
