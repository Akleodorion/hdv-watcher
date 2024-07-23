class ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items[4501..7000]
  end
end
